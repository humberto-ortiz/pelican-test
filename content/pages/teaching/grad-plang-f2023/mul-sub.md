Title: Multiplication and subtraction
date: 2023-09-09
category: Teaching
tags: hacking, learning
slug: teaching/grad-plang-f2023/mul-sub

## Assignment

In class we built an interpreter for numbers, addition, Boolean values, and conditional expressions (calc.rkt).

I have provided a new intepreter in [mul-sub.rkt]({attach}mul-sub.rkt) that removes if0 and cleans up the tests.

I also extended our parser to parse conditional expressions and Boolean constants.

```
 <expr> ::= <num>
            | TRUE | FALSE
            | { + <expr> <expr> }
            | { cnd <expr> <expr> <expr> }
```
Add subtraction and multiplication to our language. 
```
 <expr> ::= <num>
            | TRUE | FALSE
            | { + <expr> <expr> }
            | { * <expr> <expr> }
            | { - <expr> <expr> }
            | { cnd <expr> <expr> <expr> }
```
One possible way is to add multiplication to the core interpreter, then take advantage of the fact that $a - b = a + (b * -1)$, and convert subtraction in the parser to an addition and a multiplication.

Upload your revised mul-sub.rkt to moodle.
