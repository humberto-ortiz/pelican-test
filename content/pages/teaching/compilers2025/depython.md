Title: depython - OCaml types for a subset of python
date: 2024-02-13
category: Teaching
tags: hacking, learning
Slug: teaching/compilers2025/depython

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
(* depython.ml - interpretador de python simplificado
   Copyright 2025 - Humberto Ortiz-Zuazaga - humberto.ortiz@upr.edu
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.

 *)

type op = Add | Mul

type expr =
  | Constant of int
  | BinOp of expr * op * expr
  | Name of string

type stm =
  | Assign of string * expr
  | Expr of expr

type program =
  | Module of stm list

let e1 = BinOp (Constant 1, Add, Constant 3)

let p1 = Module [Expr (BinOp (Constant 1, Add, Constant 3))]

let p2 = Module [Assign ("x", Constant 6) ;
                 Expr (BinOp (Name "x", Add, Constant 1))]

type env = (string * int) list

let update (x : string) (v : int) (env : env) : env =
  (x, v) :: env

let rec lookup (x : string) (env : env) : int =
  match env with
  | [] -> failwith ("Undefined " ^ x)
  | (id, value) :: env' -> 
    if x = id then value else lookup x env'

let interp_stm s env =
  let rec calc e =
    match e with
     | Constant n -> n
     | BinOp (e1, Add, e2) -> calc e1 + calc e2
     | BinOp (e1, Mul, e2) -> calc e1 * calc e2
     | Name x -> lookup x env
  in
  match s with
   | Assign (v, e) -> update v (calc e) env
   | Expr e -> print_endline (string_of_int (calc e)) ; env

let rec interp_stms stms env =
  match stms with
   | [] -> env
   | (s::ss) -> let env' = interp_stm s env in interp_stms ss env'

let interp (p : program) =
  match p with
  | Module stms -> let _ = interp_stms stms [] in ()
```

# Homework

Add a conditional statement like `If` to depython, and implement the case in
`calc`. An `If` statement should have a test, which is compared to 0, if the
test is non-zero, evaluate the then branch, and if it is zero, evaluate the else
branch. These if statements must have both arms (the then case and the else
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
We can simplify this by saying an `If` will take a tuple of 1 expression: the test, and two statements: the then and the else.

```ocaml
type stm =
  ...
  If of expr * stm * stm
```

Here's an example depython program with an if:
```ocaml
let unif = Module [If (BinOp (Const 1, Add, Const 2), Expr (Const 4), Expr (Const 5))];;
```
running `interp unif` should result in 4.

## WARNING

Look at the follwing program:
```python
if 0:
    launch_the_missiles()
else:
    do_not_launch_missiles()
```
Try not to launch the missiles.
