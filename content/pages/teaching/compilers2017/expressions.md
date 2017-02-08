title: Straight line programs
date: 2017-01-18
category: Teaching
tags: hacking, learning
slug: teaching/compilers2017/expressions

## Description

Grammar 1.3 defines a language for *straight line programs*, with
expressions and identifiers but no control structures.

```
Stm -> Stm ; Stm            (* CompoundStm *)
Stm -> id := Exp            (* AssignStm   *)
Stm -> print ( ExpList )    (* PrintStm    *)
Exp -> id                   (* IdExp       *)
Exp -> num                  (* NumExp      *)
Exp -> Exp Binop Exp        (* OpExp       *)
Exp -> ( Stm , Exp )        (* EseqExp     *)
ExpList -> Exp , ExpList    (* exp list    *)
ExpList -> Exp
Binop -> +
Binop -> -
Binop -> *
Binop -> /
```

See the [example code for chapter
1](http://www.cs.princeton.edu/~appel/modern/ml/chap1/slp.sml) for
data structures to represent programs in this language.

1. Your first assignment is to implement a function to count the maximum
number of arguments to print in a statement (including any
subexpressions).

Be careful, you could have a program like:

```
a := (print (1, 2, 3, 4), 2) ; print ( a + 1 )
```

The first print statement has 4 arguments, so your program should
return 4 for this example.

Remember to trust the recursion.

Here are a few test cases, I think they all should return 3. What does
your program return?

```
val outer3 = PrintStm([EseqExp(PrintStm[NumExp 1, NumExp 2], NumExp 1), 
NumExp 2, NumExp 3]);

val left3 = PrintStm([EseqExp(PrintStm[NumExp 1, NumExp 2, NumExp 3], NumExp 1), 
NumExp 2]);

val right3 = PrintStm([NumExp 1, EseqExp(PrintStm[NumExp 1, NumExp 2, NumExp 3], NumExp 2)]);
```
