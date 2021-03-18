title: ANF'ed
date: 2021-03-17
category: Teaching
tags: hacking, learning
slug: teaching/compilers2021/anfed

# A(dministrative?)-Normal Form

In [Lecture 4](https://course.ccs.neu.edu/cs4410/lec_anf_notes.html), Ben Lerner
defined ANF and gave examples of converting expressions into ANF.

Let's practice checking and converting expressions into A-Normal Form (ANF). I
have several example `expr` below. For each expression, indicate if it is in ANF
or not. If it isn't in ANF, indicate why, and then convert it to ANF.

```
Num 42L
```

```
Add1 (Num 3L))
```

```
Prim2 (Plus, Num 1L, Add1 (Num 3L))
```

```
Ifnz (Num 1L, Add1 ( Num 2L), Num 4L)
```

```
Ifnz (Let ("x", Num 1L, Id "x"), Num 10L, Num 20L))
```

```
Let ("x", Num 1L, Add1 (Add1 (Id "x")))
```

```
Let ("x", Ifnz (Num 0L, Num 1L, Num 2L), Id "x")
```

```
Let ("x", Ifnz (Num 0L, Num 1L, Add1 (Num 2L)), Id "x")
```

```
Ifnz (Num 0L, Num 1L, Add1 (Add1 (Num 2L)))
```

```
Ifnz (Num 0L, Num 1L, Let ("x", Num 2L, Add1 (Id "x")))
```
