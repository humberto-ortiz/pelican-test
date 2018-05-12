title: Tiger instruction generation
date: 2018-05-09
category: Teaching
tags: hacking, learning
slug: teaching/compilers2018/instruction

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
	
Your assignment is to implement (in `semant.sml`) a code generator for
this subset of tiger. The full description of tiger is in the Appendix
A of the book, and you can get a
[short description of Tiger](http://www.cs.columbia.edu/~sedwards/classes/2002/w4115/tiger.pdf). Remember,
you don't have to implement the whole language, just what I describe
above.

I made some simplifying assumptions in mine, you can use these as
well. My compiler only works if a let is at the outermost level of an
expression, and I have only one function in the let. The function can
only have one argument. You can build a quick and dirty code generator
using print statements in the type checker in `semant.sml`.

## Quick and dirty instruction generation

Your code generator should implement a stack machine, like the one
described in
[Alex Aiken's slides](http://web.stanford.edu/class/archive/cs/cs143/cs143.1112/materials/lectures/lecture12.pdf).

For example, the program:

```
123
```

should parse as an `IntExp`. In the translator for `IntExp`, we can
print assembly code to load 123 into a register:

```
    | trexp (A.IntExp i) = {ty=Types.INT,
                            exp=(print ("li $a0, " ^ Int.toString i ^ "\n"))}
```

This code prints the MIPS assembly instruction to load an immediate
into register `$a0`, which we will use as the top of the stack. Since
`print` returns `unit`, this version of `semant.sml` has the same
types as last assignments.

To translate a more complicated expression like `e1 + e2` we need to
translate `e1` and save it to the stack, then translate `e2`, pop `e1`
to a temp register (we use `$t0`), and add them, leaving the result in
`$a0`. The stack pointer must end up at the same position as when we
started.

```
    | trexp (A.OpExp{left, A.PlusOp, right, pos}) =
            let
                val e1 = trexp left
            in
                checkInt (e1, pos);
                print "sw $a0, 0($sp)\n";     (* save e1 *)
				print "addiu $sp, -4\n";       (* push stack *)
				let
                    val e2 = trexp right
                in
                    checkInt (e2, pos);
                end;
                {ty=Types.INT,
				exp=(
					print "lw $t1, 4($sp)\n";    (* copy e1 to tmp *)
					print "add $a0, $t1, $a0\n"; (* add e1 and e2 *)
					print "addiu $sp, 4\n"        (* pop stack *)
				)}
            end
```
			
You
may continue to expand on this, but you don't have to do any real type
checking for this language, as we only have integer expressions.

## Example code

Here's a small program `5 + 3` that should generate code.

```
- Semant.transProg (Parse.parse "sum.tig");
main:
li $a0, 5
sw $a0, 0($sp)
addiu $sp, $sp, -4
li $a0, 3
lw $t1, 4($sp)
add $a0, $t1, $a0
addiu $sp, $sp, 4
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
