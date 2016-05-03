title: Tiger instruction generation
date: 2016-04-27
category: Teaching
tags: hacking, learning
slug: teaching/compilers2016/instruction

## Description

Construct an instruction generator for a subset of tiger that includes
the following:

```
exp:
	int
	exp binop exp
	id ( explist )
	let declist in exp end
	if test then exp else exp

binop:
	+ - * /

test:
   exp = exp

declist:
	dec
	dec declist
		
dec: 
	function id ( formals ) = exp

explist:
	exp
	explist , exp

formals:
	formal
	formal, formals

formal:
	id

```
	
Your assignment is to implement (in semant.sml) a code generator for
this subset of tiger. The full description of tiger is in the Appendix
A of the book, and you can get a
[short description of Tiger](http://www.cs.columbia.edu/~sedwards/classes/2002/w4115/tiger.pdf). Remember,
you don't have to implement the whole language, just what I describe
above.

I made some simplifying assumptions in mine, you can use these as
well. My compiler only works if a let is at the outermost level of an
expression, and I have only one function in the let. The function can
only have one argument. We started a quick and dirty code generator in
class, using print statements in the type checker in semant.sml. You
may continue to expand on this, but you don't have to do any real type
checking for this language, as we only have integer expressions.

Your code generator should implement a stack machine, like the one
described in
[Alex Aiken's slides](http://web.stanford.edu/class/archive/cs/cs143/cs143.1112/materials/lectures/lecture12.pdf).


## Example code

Here's a simple program `5 + 3` that should generate code.

```
- Semant.transProg (Parse.parse "sum.tig");
main:
li $a0, 5
mov $sp, $a0
addi $sp, 4
li $a0, 3
mov $sp, $a0
addi $sp, 4
get tmp
add
pop
val it = () : unit
```

A recursive implementation of Fibonacci.

```
let
  function fib(n) =
    if n = 0 then 0 else
    if n = 1 then 1 else
      fib(n - 1) + fib(n - 2)
in
  fib(10)
end
```

Should result in code like the following. You can load the code into
the
[MARS MIPS simulator](http://courses.missouristate.edu/KenVollmar/mars/index.htm)
and run it.

```
main:
	b start

fib:
	move $fp $sp
	sw $ra 0($sp)
	addiu $sp $sp -4
	lw $a0, 4($fp)
	sw $a0 0($sp)
	addiu $sp $sp -4
	li $a0, 0
	lw $t1 4($sp)
	addiu $sp $sp 4
	beq $a0 $t1 true_branch1

false_branch1:
	lw $a0, 4($fp)
	sw $a0 0($sp)
	addiu $sp $sp -4
	li $a0, 1
	lw $t1 4($sp)
	addiu $sp $sp 4
	beq $a0 $t1 true_branch2

false_branch2:
	sw $fp 0($sp)
	addiu $sp $sp -4
	lw $a0, 4($fp)
	sw $a0, 0($sp)
	addiu $sp, $sp, -4
	li $a0, 1
	lw $t1, 4($sp)
	 sub $a0, $t1, $a0
	 addiu $sp, $sp, 4
	sw $a0 0($sp)
	addiu $sp $sp -4
	jal fib
	sw $a0, 0($sp)
	addiu $sp, $sp, -4
	sw $fp 0($sp)
	addiu $sp $sp -4
	lw $a0, 4($fp)
	sw $a0, 0($sp)
	addiu $sp, $sp, -4
	li $a0, 2
	lw $t1, 4($sp)
	 sub $a0, $t1, $a0
	 addiu $sp, $sp, 4
	sw $a0 0($sp)
	addiu $sp $sp -4
	jal fib
	lw $t1, 4($sp)
	 add $a0, $t1, $a0
	 addiu $sp, $sp, 4
	b end_if2

true_branch2:
	li $a0, 1

end_if2:
	b end_if1

true_branch1:
	li $a0, 0

end_if1:
	lw $ra 4($sp)
	addiu $sp $sp 12
	lw $fp 0($sp)
	jr $ra

start:
	sw $fp 0($sp)
	addiu $sp $sp -4
	li $a0, 10
	sw $a0 0($sp)
	addiu $sp $sp -4
	jal fib
```
	
