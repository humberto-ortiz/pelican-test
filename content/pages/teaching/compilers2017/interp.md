title: Interpreter for SLP
date: 2017-01-28
category: Teaching
tags: hacking, learning
slug: teaching/compilers2017/interpreter

## Description

The second programming assigment in chapter 1 is 
> Write an ML function interp : stm→unit that “interprets” a program
>   in this language. To write in a “functional” style – without
>   [sml] assignment (:=) or arrays – maintain a list of (variable,integer)
>   pairs, and produce new versions of this list at each AssignStm.

Appel suggests making two mutually recursive funcions:

```
val interpStm = fn : stm * table -> table
val interpExp = fn : exp * table -> int * table
```

These thread a `table`, a list of mappings from identifiers to values,
through the interpreter to keep track of the assignment statements:

```
type table = (id * int) list
```

Then you can write functions `lookup` and `update` to update the table
on assignments, and lookup the current value of an identifier.

```
val lookup = fn : table * id -> int
val update = fn : table * id * int -> table
```
