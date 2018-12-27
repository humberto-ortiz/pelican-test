title: depython - sml data structures for a simplified subset of python
date: 2018-12-22
category: Teaching
tags: hacking, learning
slug: teaching/compilers2019/depython

# Introduction

Python has tools for examining python source code. Let's look at some examples in python 2.7.

```
import ast

ast.dump(ast.parse("123"))
```
The result should be:
```
'Module(body=[Expr(value=Num(n=123))])'
```
A slightly more complicated expression:
```
ast.dump(ast.parse("2 + 3"))
```
Results in:
```
'Module(body=[Expr(value=BinOp(left=Num(n=2), op=Add(), right=Num(n=3)))])'
```
Assignment statements and variables
```
code = """
a = 2
b = 3

print a * b + b 
"""

ast.dump(ast.parse(code))
```

```
"Module(body=[
Assign(targets=[Name(id='a', ctx=Store())], value=Num(n=2)),
Assign(targets=[Name(id='b', ctx=Store())], value=Num(n=3)),
Print(dest=None, values=[BinOp(left=BinOp(left=Name(id='a',
ctx=Load()), op=Mult(), right=Name(id='b', ctx=Load())), op=Add(),
right=Name(id='b', ctx=Load()))], nl=True)])"
```

Program 1.5 in the textbook defines data structures for Straight Line Programs (SLP), a simple language with variables and expressions, but no control statements or functions. The subset of python we've seen so far is not much different than SLP. In fact we can define data structures for "depython", very similar to Program 1.5.

```
type id = string

datatype binop = Add | Mult

datatype prog = Module of stm list

and stm = Assign of id * exp
	| Print of exp list
	| Expr of exp

and exp = Num of int
	| BinOp of exp * binop * exp
	| Name of id
	| Eseq of stm * exp

val p1 = Module [Expr (Num 123)];

val p2 = Module [Expr (BinOp (Num 3, Add, Num 2))] : prog;

val p3 = Module [Assign ("a", Num 3), Print [BinOp (Name "a", Mult, Num 2)]];
```

# Exercises

1. Write a pretty printer for depython programs `pretty : prog ->
   unit` that prints out a human readable version of the given
   program.

1. Write an interpreter for depython, following the instructions for
   the SLP interpreter. You will need a function `interp : prog ->
   unit` that interprets the top level program, and auxiliary
   functions to interpret the `stm` and `exp` datatypes in an
   appropriate environment. You should have mutualy recursive
   functions `interpStm stm * table -> table` and `interpExp exp *
   table -> int * table`. A table is a list of (id, int) pairs, and
   the first id that matches should hold the current value of the
   id. You should have `update` and `lookup` functions that add new
   bindings and lookup current values. `update : table * id * int ->
   table` takes a table, and adds a binding of id to the given
   int. `lookup : table * id -> int` looks up the id in the given
   table and returns the current value.
