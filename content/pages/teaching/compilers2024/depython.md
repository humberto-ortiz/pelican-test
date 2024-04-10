Title: depython - OCaml types for a subset of python
date: 2024-02-06
category: Teaching
tags: hacking, learning
Slug: teaching/compilers2024/depython

# Introduction

In class we looked at `depython`, some types for representing python abstract syntax trees.

In python you can *introspect* code using the `ast` module.

```python
import ast

ast.dump(ast.parse("123"), annotate_fields=False)
```
The result is
```
'Module([Expr(Constant(123))], [])'
```

A more complicated example:

```python
ast.dump(ast.parse("2+3"), annotate_fields=False)
```
Results in
```
'Module([Expr(BinOp(Constant(2, None), Add(), Constant(3, None)))], [])'
```

# Types

We can define OCaml types similar to the above representations of python ast

```ocaml
(* depython - data types for representing python code 
   Copyright 2024 Humberto Ortiz-Zuazaga <humberto.ortiz@upr.edu>
   See LICENSE file for details.
*)

type op = Add | Mult

type depython =
 | BinOp of depython * op * depython
 | Const of int
 | Name of string
 | Assign of string * depython

(* environments map variable names like "x" to an int like 3 *)
type env = (string * int) list

(* extend the environment env with a binding of n to name v *)
let guardar ((v : string), (n : int), (env : env)) : (int * env) =
  (n, (v, n) :: env)

(* find the int bound to v in the environment (or fail) *)
let rec lookup (v, env) =
  match env with
  | [] -> failwith "No existe"
  | (x, n)::xs -> if x = v then n else lookup (v, xs)

let rec calc ((e : depython), (env : env)) : (int * env) =
(* given an expression e and an environment env, return the value of e and a
 new environment *)
  match e with
  | Const n -> (n, env)
  | BinOp (l, Add, r) ->
     let lv, env' = calc (l, env) in
     let rv, env'' = calc (r, env') in
     lv + rv, env''
  | BinOp (l, Mult, r) ->
     let lv, env' = calc (l, env) in
     let rv, env'' = calc (r, env') in
     lv * rv, env''
  | Assign (x, e) ->
     let lv, env' = calc (e, env) in
     guardar (x, lv, env')
  | Name x -> (lookup (x, env), env)

let interp (es : depython list) : int =
  let rec help (es, env, n) =
    match es with
    | [] -> n
    | (e :: es) ->
       let n, env' = calc (e, env) in
       help (es, env', n)
  in
  help (es, [], 0)
```

# Homework

Add a conditional expression like `If` to depython, and implement the case in
`calc`. An `If` expression should have a test, which is compared to 0, if the
test is non-zero, evaluate the then branch, and if it is zero, evaluate the else
branch. These if expressions must have both arms (the then case and the else
case).

Here's the python ast for a small example if:
```python
>>> import ast
>>> prog = """if 0:
...     1
... else:
...     2
...
... """
>>> ast.dump(ast.parse(prog), annotate_fields=False)
'Module([If(Constant(0), [Expr(Constant(1))], [Expr(Constant(2))])], [])'
```
We can simplify this by saying an `If` will take a tuple of 3 expressions, the test, the then branch and the else.

Here's an example depython program with an if:
```ocaml
let unif = [If (BinOp (Const 1, Add, Const 2), Const 4, Const 5)];;
```
running `interp unif` should result in 4.

## WARNING

Remember our whiteboard example:

```python
if 0:
    launch_the_missiles()
else:
    do_not_launch_missiles()
```
Try not to launch the missiles.
