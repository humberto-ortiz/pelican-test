title: Parser for infix
date: 2022-02-25
category: Teaching
tags: hacking, learning
slug: teaching/compilers2022/parser

## Description

I have provided a [pretty printer for depython on
github](https://github.com/humberto-ortiz/compilers-2022/tree/main/pretty).

Your task is to modify our lexer and parser to recognize a small language with infix arithmetic as
described in [Lecture
4](https://course.ccs.neu.edu/cs4410/lec_anf_notes.html#%28part._infix._.Growing_the_language__adding_infix_operators%29).

```
‹expr›: 
           NUMBER
           add1 ( ‹expr› )
           sub1 ( ‹expr› )
           ( <expr> )
           <expr> + <expr>
           <expr> - <expr>
           <expr> * <expr>
```

Your parser should produce an abstract syntax as shown in Lecture 3 and 4 as well:

```{ocaml}
type prim2 =
  | Plus
  | Minus
  | Times
  
type expr =
  | Num of int64
  | Add1 of expr
  | Sub1 of expr
  | EPrim2 of prim2 * expr * expr
```

## Example code

There's sample code in github. To run it you will need menhir and dune
installed. I used opam to install mine.

You can parse a sample depython program using:

```
$ dune build
$ dune exec ./pretty.exe 4410.dp
Num 4410
```

After modifying the lexer and parser you should be able to parse a program like
the examples in lecture 4.

```
$ cat 234.dp
(2 + 3) + 4
```

The current parser can't understand this program:
```
$ dune exec ./pretty.exe 234.dp
Fatal error: exception Dune__exe__Parser.MenhirBasics.Error
```
After you complete the assignment, the output should be:
```
EPrim2 (Plus, EPrim2 (Plus, Num 2L, Num 3L), Num 4L) 
```

# Deliverables

You should turn in your modified `lexer.mll` and `parser.mly`. You shouldn't
need to make changes to other files.
