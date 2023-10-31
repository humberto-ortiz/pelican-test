Title: Interpreter for multiple function arguments
date: 2022-10-25
category: Teaching
tags: hacking, learning
slug: teaching/grad-plang-f2022/many

## Assignment

In class we developed an interpreter for our language that allowed
functions with exactly one argument:

```pyret
  | appC(f :: ExprC, a :: ExprC)
  | fdC(arg :: String, body :: ExprC)
```

Your assignment is to remove this restriction, and allow functions to have zero
or more arguments.

## Alternatives

There are many ways this feature could be implemented. In class we discussed
using desugaring to define nested functions for each argument. Another way is to
extend the core language and define multi-argument functions:

```pyret
  | appC(f :: ExprC, args :: List<ExprC>)
  | fdC(args :: List<String>, body :: ExprC)
```

## Hints

In any case, you will likely be working with lists of arguments, both formal and
actual. I suggest you look at the functions defined on [lists in
pyret](https://www.pyret.org/docs/latest/lists.html). In particular, `map`,
`fold`, and `fold2` may be very useful.
