title: Parser for a Tiger subset
date: 2018-03-01
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

## Assignment

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

