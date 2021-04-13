title: Calling print
date: 2021-04-06
category: Teaching
tags: hacking, learning
slug: teaching/compilers2021/print

## Description

I have provided a [compiler for parenlet with Booleans on
github](https://github.com/humberto-ortiz/compilers-s2021/tree/main/bools).

Your task is to modify my lexer, parser, and compiler to add a print expression to parenlet, a small language
described below:
```
‹expr›: 
           BOOL
           NUMBER
           ID
           ( let (ID <expr> ) <expr> )
           ( add1 ‹expr› )
           ( print ‹expr› )
```

Your parser should produce an `EPrim1` expression for the print:

```{ocaml}
type expr =
  | EBool of bool
  | ENum of int64
  | EId of string
  | ELet of string * expr * expr
  | EPrim1 of prim1 * expr
```
## Semantics

The `print` expression takes 1 expression as argument. It should print the value
of the argument. The `print` is an expression, so it should return a value, as
determined by the argument.

## Hints

Look at how we call `error` from assembly. There is already a `print` function in `main.c` that you could also call. What is the sequence of assembly instructions needed to call `print` with the correct arguments?

## Example code

Here are some programs that should run in your finished compiler.

```
(print 3)
```

```
(print (add1 3))
```

```
(let (x (print 4))
  (add1 x)) 
```

# Deliverables

You should turn in your modified `lexer.mll`, `parser.mly`, `compiler.ml` and
`syntax.ml`. You shouldn't need to make changes to other files (really).

If you want, run `dune clean` and zip up your entire `parenlet` directory.
