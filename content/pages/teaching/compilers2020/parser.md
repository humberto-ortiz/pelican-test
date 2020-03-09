title: Parser for expressions with "let"
date: 2020-03-03
category: Teaching
tags: hacking, learning
slug: teaching/compilers2020/parser

## Description

I have provided a [lexer and parser for depython on github](https://github.com/humberto-ortiz/compilers-2020/tree/master/parse-dp).

Your task is to modify my lexer and parser to recognize a small language described in [Lecture 3](https://course.ccs.neu.edu/cs4410sp20/lec_let-and-stack_notes.html).

```
‹expr›: 
           NUMBER
           add1 ( ‹expr› )
           sub1 ( ‹expr› )
           IDENTIFIER
           let IDENTIFIER = <expr> in <expr>
```

Your parser should produce an abstract syntax as shown in Lecture 3 as well:

```{ocaml}
type expr =
  | Num of int64
  | Add1 of expr
  | Sub1 of expr
  | Id of string
  | Let of string * expr * expr
```

## Example code

There's sample code in github. To run it you will need menhir, ocamlfind and ocamlbuild installed. I used opam to install mine.

You can parse a sample depython program using:

```
$ make main.byte
$ ./main.byte tests/112.dp
112
```

After modifying the lexer and parser you should be able to parse a program like today's.

```
let
  a = 3 in let
  b = 2 in
  add1(a)
```

If you want, you can load the parser, lexer, and main into ocaml/utop using the provided .ocamlinit file and parse a program string using the parse function to see the AST produced:

```
$ rlwrap ocaml
        OCaml version 4.05.0

# parse "3 * 4 + 32";;
- : Syntax.prog =
Module [Expr (BinOp (BinOp (Num 3, Mult, Num 4), Add, Num 32))]
```

# Deliverables

You should turn in your modified `lexer.mll`, `parser.mly`, `pretty.ml` and `syntax.ml`. You shouldn't need to make changes to other files.
