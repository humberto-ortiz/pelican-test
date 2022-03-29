title: Pretty printer for dpc
date: 2022-03-28
category: Teaching
tags: hacking, learning
slug: teaching/compilers2022/prettier

## Description

I have provided a [pretty printer for depython on
github](https://github.com/humberto-ortiz/compilers-2022/tree/main/prettier),
but it's imcomplete, it can't pretty print if or let expressions.

Your task is to modify our pretty printer to pretty print any valid `expr`.


```
‹expr›: 
           NUMBER
           add1 ( ‹expr› )
           sub1 ( ‹expr› )
           ( <expr> )
           <expr> + <expr>
           <expr> - <expr>
           <expr> * <expr>
           if <expr>: <expr> else: <expr>
           let IDENTIFIER = <expr> in <expr>
           IDENTIFIER
```

Your pretty printer should produce a printed representation of
abstract syntax as shown in `syntax.ml` as a string.

```ocaml
type expr =
  | Num of int64
  | Add1 of expr
  | Sub1 of expr
  | EPrim2 of prim2 * expr * expr
  | Id of string
  | Let of string * expr * expr
  | If of expr * expr * expr
```

## Example code

There's sample code in github. To run it you will need menhir and dune
installed. I used opam to install mine.

You can parse a sample depython program using:

```
$ dune build
$ dune exec ./prettier.exe 4410.dp
Num 4410
```

After modifying the lexer and parser you should be able to parse a program like
the examples in lecture 4.

```
$ cat ifif.dp
if 0:
   7
else:
      if 1:
         9
      else:
         42

```

The current pretty printer can't understand this program:
```
$ dune exec ./prettier.exe ifif.dp

```
After you complete the assignment, the output should be:
```
If (Num 0L, Num 7L, If (Num 1L, Num 9L, Num 42L))
```

# Deliverables

You should turn in your modified `prettier.ml` in moodle. You shouldn't
need to make changes to other files.
