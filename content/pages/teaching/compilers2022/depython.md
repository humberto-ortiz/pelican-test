Title: depython - OCaml types for a subset of python
date: 2022-02-03
category: Teaching
tags: hacking, learning
Slug: teaching/compilers2022/depython

# Introduction

In class we looked at `depython`, some types for representing python abstract syntax trees.

In python you can *introspect* code using the `ast` module.

```
import ast

ast.dump(ast.parse("123"))
```
The result is
```
Module(body=[Expr(value=Num(n=123))])
```

A more complicated example:

```python
ast.dump(ast.parse("2 + 3"))
```
Results in
```
Module(body=[Expr(value=BinOp(left=Num(n=2), op=Add(), right=Num(n=3)))])
```

# Types

We can define OCaml types similar to the above representations of python ast

```ocaml
(* depython - data types for representing python code 
   Copyright 2022 Humberto Ortiz-Zuazaga <humberto.ortiz@upr.edu>
   See LICENSE file for details.
*)

type binop = Add | Sub | Mul | Div

type expr =
 | BinOp of binop * expr * expr 
 | Num of int                   
 | Name of string               

type stm =
 | Expr of expr
 | Print of expr
 | Assign of string * expr

type prog = Module of stm list

let p1 = Module [Assign ("a", BinOp (Add, Num 5, Num 4))];;

let rec interp e =
  (* unfinished *)
  match e with
    | Num x -> x
    | BinOp (Add, e1, e2) -> interp e1 + interp e2
```

I have made a [github repository](https://github.com/humberto-ortiz/compilers-2022) with the depython data types.

# Homework

Implement a function to compute the depth of the largest expression in a depython `prog`. Be careful to check everywhere there may be an expression.

## Examples

Some example depython programs and their depth:

```
Module [Expr (Num 33)]
```
Depth 0.


```
Module [Print (BinOp (Sub, Num 112, Num 23))]
```
Depth 1.

```
Module [Assign ("a", Num 4);
        Expr (BinOp (Add, Num 8, 
                          BinOp (Mul , Name "a", Name "a")))]
```
Depth 2.
