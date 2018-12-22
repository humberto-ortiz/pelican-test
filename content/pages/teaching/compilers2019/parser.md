title: Parser for a Tiger subset
date: 2018-12-22
category: Teaching
tags: hacking, learning
slug: teaching/compilers2019/parser

## Description

Construct a parser for a subset of tiger that includes the following

```
exp:
	lvalue
	nil
	int
	string
	exp binop exp
	lvalue := exp
	id ( explist )
	( expseq )
	let declist in expseq end
	if exp then exp
	if exp then exp else exp

lvalue:
	# These are simple variables
	id

binop:
	+ - * / = <> < > <= >= & |

declist:
	dec
	dec declist
		
dec: 
	type id = id
	var id : id := exp
	function id ( typefields ) : id = exp

expseq:
    exp
	expseq ; exp

explist:
	exp
	explist , exp

typefields:
	typefield
	typefield, typefields

typefield:
	id : id
```
	
**NOTE:** the only valid type ids in our language are aliases of the
built in "int" and "string" types. We do not have arrays or structures
or other compound types.

## Part 1

Your assignment is to use the sample code in
[chapter 3](https://www.cs.princeton.edu/~appel/modern/ml/chap3/) to
implement (in tiger.grm) a parser for this subset of tiger. The full
description of tiger is in the Appendix A of the book, and you can get
a
[short description of Tiger](http://www.cs.columbia.edu/~sedwards/classes/2002/w4115/tiger.pdf). Remember,
you don't have to implement the whole language, just what I describe
above. Also, each grammar production should return unit `()`. In the next part you will build an abstract systax tree, but for now just get the grammar working. Save a copy of your working grammar, in case you can't get Part 2 working.

You will definitely need to read Chapter 3 to see examples of building
a parser, and the [ML-Yacc manual](http://www.smlnj.org/doc/ML-Yacc/)
is also useful.

Try to keep the number of conflicts in your parser to a minimum. You
must not have any reduce-reduce conflicts, and explain any
shift-reduce conflicts and how they are resolved.

## Example code

You can parse a sample program using:

```
- CM.make "sources.cm";
- Parse.parse "test.tig";
  () : unit
```

Here's a simple program that should parse.

```
let
  function fac(n : int) : int =
	if n <= 1 then
		1
	else
		n * fac(n - 1)
in
	fac(5)
end
```

## Part 2


Your assignment is to use the sample code in
[chapter 4](https://www.cs.princeton.edu/~appel/modern/ml/chap4/) to
implement (in `tiger.grm`) a parser for this subset of tiger that
builds the appropriate abstract syntax tree for each
production. Remember, in the last part all the productions
returned unit `()`?  We said later you would have to change it? Now
each production must return an `Absyn`. Look at the `absyn.sml` to see
the data structures you must build.

For example, in `absyn.sml` we see that one possible expression is a
`StringExp` that has a string and an int (representing the postition
of the string in the file). Then in your `tiger.grm` you should have a line like

```
exp : STRING (Absyn.StringExp (STRING, STRINGleft))
```

(if you get tired of typing `Absyn.XXXX` all the time, alias `Absyn`
to `A`, like the book says.)

The full description of tiger is in the Appendix A of the book, and
you can get a
[short description of Tiger](http://www.cs.columbia.edu/~sedwards/classes/2002/w4115/tiger.pdf). Remember,
you don't have to implement the whole language, just what I describe
above.

You will definitely need to read Chapter 4 to see examples of building
a parser and abstract syntax tree, and the
[ML-Yacc manual](http://www.smlnj.org/doc/ML-Yacc/) is also useful.

## Example code

I built a parser for Straight Line Programs (SLP), that reads the text
and outputs a AST using a structure like `slp.sml` from Chapter 1. I
also connected that parser with my own SLP interpreter. You can read
[my code](https://github.com/humberto-ortiz/compilers-2017) to see how
to build AST for SLP in `slp/slp.grm`. Your assignment is **not** to
implement an SLP parser, but a parser for tiger. This is just so you
can get an idea for building the AST in the productions.

```
$ cat prog.slp
a := 5 + 3;
b := (print (a, a-1), 10*a);
print (b)

$ rlwrap sml
Standard ML of New Jersey v110.76 [built: Mon Jul  7 23:25:08 2014]
- CM.make "sources.cm";
[autoloading]
[library $smlnj/cm/cm.cm is stable]
...
[loading (sources.cm):parse.sml]
[New bindings added.]
val it = true : bool

- val prog = Parse.parse "prog.slp";
val prog =
  CompoundStm (AssignStm ("a",OpExp #),CompoundStm (PrintStm #,PrintStm #))
  : Absyn.stm

- Interp.interp prog;
8
7
80
val it = () : unit
```

