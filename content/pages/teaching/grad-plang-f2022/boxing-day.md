Title: Boxing day
date: 2022-11-15
category: Teaching
tags: hacking, learning
Slug: teaching/grad-plang-f2022/boxing-day

## Assignment

In class we developed [an
interpreter](https://drive.google.com/file/d/1ZwYZao0lpzL_4lxHPQ2HaraECEbF87Q1/view?usp=share_link)
for a language that includes `box`, `unbox` and `setbox` by passing a *store* in
addition to the environment. It has a peculiarity in that `setbox`'ing a box to
a new value returns the value, not the box.

We discussed in class that we can use our implementation of functions to name a
box, so that we can setbox it later.

The intepreter already has an example of using nested functions to name two
variables and add them:

```pyret
# Funciones anidadas
inner-fun = fdC("y", numT, numT, binopC(plusOpC, idC("x"), idC("y")))
outer-fun = fdC("x", numT, funT(numT, numT), inner-fun)

app-outer = appC(appC(outer-fun, numC(2)), numC(3))
```

Write a function application that names a box, so that you can setbox it to a
different value, then unbox it to get the new value. You may only need one fdC,
since you only need to name one thing. Remember you do need to do two things to
the box, setbox it, and then unbox it.
