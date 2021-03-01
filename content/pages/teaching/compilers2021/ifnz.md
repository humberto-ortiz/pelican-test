title: Adding conditionals
date: 2021-03-01
category: Teaching
tags: hacking, learning
slug: teaching/compilers2021/ifnz

## Description

I have provided a [compiler for parenlet on
github](https://github.com/humberto-ortiz/compilers-s2021/tree/main/parenlet).

Your task is to modify my lexer, parser, and compiler to add conditionals to parenlet, a small language
described below:
```
‹expr›: 
           NUMBER
           ID
           ( add1 ‹expr› )
           ( sub1 ‹expr› )
           ( let ( ID <expr> ) <expr> )
           ( ifnz <expr> <expr> <expr> )
```

Your parser should produce an abstract syntax as shown in Lecture 4 as well:

```{ocaml}
type expr =
  | Num of int64
  | Add1 of expr
  | Sub1 of expr
  | Id of string
  | Let of string * expr * expr
  | Ifnz of expr * expr * expr
```

## Example code

There's sample code in github. To run it you will need menhir and dune
installed. I used opam to install mine.

You can compile a sample parenlet program using:

```
$ dune build
$ dune exec ./compiler.exe test-parenlet/112.pl 
                     
section .text
global our_code_starts_here
our_code_starts_here:
mov rax, 112

  ret

$ dune exec ./compiler.exe test-parenlet/let.pl 
                     
section .text
global our_code_starts_here
our_code_starts_here:
mov rax, 23
mov [rsp + 8*-1], rax
mov rax, [rsp + 8*-1]

  ret

```

After modifying the lexer, parser, and compiler you should be able to parse a program like
the tests in test-ifnz

```
(ifnz 5 6 42)
```

```
(ifnz (add1 0) 6 7)
```

```
(let (x (ifnz 10 11 12)) (add1 x))
```

# Deliverables

You should turn in your modified `lexer.mll`, `parser.mly`, `compiler.ml` and
`syntax.ml`. You shouldn't need to make changes to other files.

If you want, run `dune clean` and zip up your entire directory.
