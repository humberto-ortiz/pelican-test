Title: Multiplication and subtraction
date: 2023-09-09
category: Teaching
tags: hacking, learning
slug: teaching/grad-plang-f2024/mul-sub

## Assignment

In class we built an interpreter and parser for numbers and addition ([eval-mejorado.rkt]({attach}eval-mejorado.rkt)).

Add subtraction and multiplication to our language. 
```
 <expr> ::= <num>
            | { + <expr> <expr> }
            | { * <expr> <expr> }
            | { - <expr> <expr> }
```

You should modify the parser to recognize subtraction and multiplication, and
produce an appropriate AST. The `eval` function must also be modified to
recognize and carry out the correct operations.

You should turn in your revised interpreter in moodle.

## Examples

The following sample tests should work, you should also include further tests.

```
(test (run `{- 2 3}) -1)
(test (run `{* 5 6}) 30)
```
