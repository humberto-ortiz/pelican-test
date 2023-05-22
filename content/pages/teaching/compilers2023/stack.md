title: Stack frames
date: 2023-04-27
category: Teaching
tags: hacking, learning
slug: teaching/compilers2023/stack
status: published

## Objective

One of the [program objectives](https://natsci.uprrp.edu/ccom/educational-objectives-and-program-outcomes/) is that students should develop:

- SO-07 : Ability to identify and formulate
  problems in various real-life situations that can be solved by
  concepts and computational models and to implement them effectively.

## Assignment

When we implement user-defined functions, we need to ensure we
maintain stack discipline. Local variables, including those introduced
by transformation to A-Normal Form, will affect the stack. (See [Stack
Frame
Sizes](https://course.ccs.neu.edu/cs4410sp22/lec_function-calls_notes.html#%28part._.Stack_frame_sizes%29)
for a discussion of the issues.)

Design and implement a `countVars` function to calculate how much stack space an
expression will require. Your input will be a `tag aexpr`, and you can output an
`int`, with the number of stack slots it will require.

## Examples

Given:
```
APrim2 (Plus, INumber (10L, 1), INumber (11L, 2), 3)
```
you should return:
```
0
```

Given:
```
ALet ("_prim21l", AImm (INumber (10L, 2)),
 ALet ("_prim21r", AImm (INumber (10L, 3)),
  APrim2 (Plus, IId ("_prim21l", 1), IId ("_prim21r", 1), 1), 1),
 1)
```
you should return:
```
2
```

P.S. You don't need to load the entire compiler to work on this assignment, if you place your code in `count.ml` you can run:

```
$ dune utop
utop # #mod_use "syntax.ml";;
utop # #use "count.ml";;
```
and then test your function.
