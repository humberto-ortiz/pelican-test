title: Straight line programs
date: 2017-01-18
category: Teaching
tags: hacking, learning
slug: teaching/compilers2017/expressions

## Description

Grammar 1.3 defines a language for *straight line programs*, with
expressions and identifiers but no control structures.

```
Stm -> Stm ; Stm
Stm -> id := Exp
Stm -> print ( ExpList )
Exp -> id
Exp -> num
Exp -> Exp Binop Exp
Exp -> ( Stm , Exp )
ExpList -> Exp , ExpList
ExpList -> Exp
Binop -> +
Binop -> -
Binop -> *
Binop -> /
```

See the [example code for chapter
1](http://www.cs.princeton.edu/~appel/modern/ml/chap1/slp.sml) for
data structures to represent programs in this language.

Your first assignment is to implement a function to count the maximum
number of arguments to print in a statement (including any
subexpressions).

Be careful, you could have a program like:

```
3 ; a := (print (1, 2, 3, 4), 2) ; print ( a + 1 )
```

The first print statement has 4 arguments, so your program should
return 4 for this example.

Remember to trust the recursion.

You will later have an assignment to implement an interpreter for
straight line programs. Look at the programming assignment in chapter
1 to start.
