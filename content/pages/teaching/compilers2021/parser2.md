title: Parser for parenlet
date: 2021-02-25
category: Teaching
tags: hacking, learning
slug: teaching/compilers2021/parser-parenlet

## Description

I have provided a [lexer and parser for dedepython+ on
github](https://github.com/humberto-ortiz/compilers-s2021/tree/main/dedeplus-parser).

Your task is to modify my lexer and parser to recognize a small language
described below:
```
‹expr›: 
           NUMBER
           ID
           ( add1 ‹expr› )
           ( sub1 ‹expr› )
           ( let ( ID <expr> ) <expr> )
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

There's sample code in github. To run it you will need menhir and dune
installed. I used opam to install mine.

You can parse a sample depython program using:

```
$ dune build
$ dune exec ./main.exe tests/112.dp
Module [
Expr Num 112
]
```

After modifying the lexer and parser you should be able to parse a program like
the examples below.

```
(add1 42)
```

```
(add1(sub1(add1 42)))
```

```
(let (x 3) (add1 x))
```

BUT OTHER PROGRAMS SHOULD BE ILLEGAL:

```
2 + 3
```

```
(123)
```

```
print 2
```

# Deliverables

You should turn in your modified `lexer.mll`, `parser.mly`, `pretty.ml` and
`syntax.ml`. You shouldn't need to make changes to other files.
