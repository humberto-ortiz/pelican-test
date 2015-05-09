Title: Study guide for second exam
Slug: teaching/compilers/study-guide
Date: 2015/05/09
Category: Teaching
Tags: study guide, compilers, front end

# CCOM 4087 - Compiler Design 

The second partial exam will be on Chapters 5, 6, and 7. These
complete the compiler front-end, taking the abstract syntax produced
by the parser and emitting intermediate representation.

We'll be using a subset of the tiger language, described in the pages
for [HW5]({filename}semantic.md) and [HW6/7]({filename}intermediate.md).

## Semantic analysis

Consider the following tiger program:

```
let
  function id(a:int):int = a
in
  id(23)
end
```

When parsed, this results in the AST shown below:

```
LetExp([
 FunctionDec[
  (id,[
   (a,true,int)],
SOME(int),
   VarExp(
    SimpleVar(a)))]],
 SeqExp[
  CallExp(id,[
   IntExp(23)])])
```

Describe the process of typechecking this program. What happens in the
environment? what happens in transExpr?

## Stack frames

Diagram the stack frame produced for the `id` function. Show all the
information recorded for the frame.

## Intermediate Representation

Here's a simple tiger program:

```
5 + 3 * 2
```

the AST produced is:

```
OpExp(PlusOp,
 IntExp(5),
 OpExp(TimesOp,
  IntExp(3),
  IntExp(2)))
```

Part of the IR Tree:

```
MOVE(
 TEMP t129,
 BINOP(PLUS,
   CONST 5,
   BINOP(MUL,
		  CONST 3,
		  CONST 2)))
```
			  
Identify each expression in the program and the corresponding IR
Tree. You should be able to construct a similar Tree for a different
program.
