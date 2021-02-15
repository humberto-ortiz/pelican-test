Title: dedepython - OCaml types for a subset of python
date: 2021-01-28
category: Teaching
tags: hacking, learning
Slug: teaching/compilers2021/dedepython

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
type binop = Add | Sub | Mult | Div

type exp =
    | Num of int
    | BinOp of exp * binop * exp

type stm =
    | Expr of exp

type prog =
    | Module of stm list
```

I have made a [github repository](https://github.com/humberto-ortiz/compilers-s2021) with the data types, some build instructions, and the beginning of a test suite.

# Homework

Implement an interpreter for the `prog` type, following the skeleton in the example code. See the [README.md](https://github.com/humberto-ortiz/compilers-s2021/blob/main/README.md) file for more details. Be careful to not change the types of the funcion or data. My test suite should build against your dedepython file.
