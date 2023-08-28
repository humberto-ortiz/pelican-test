Title: Flag day
date: 2023-08-27
category: Teaching
tags: hacking, learning
slug: teaching/grad-plang-f2023/flag-day

## Assignment

The [quick introduction to racket](https://docs.racket-lang.org/quick/index.html) shows how to make pictures with the `slideshow` language. The pict documentation shows how to draw other primitives and combine them with functions like [`hc-append`](https://docs.racket-lang.org/pict/Pict_Combiners.html#%28def._%28%28lib._pict%2Fmain..rkt%29._hc-append%29%29).

Your assignment is to write a function, `pr-flag`, to draw a flag of Puerto Rico with a specified width in pixels:

```racket
(pr-flag 100)
```
should draw a flag 100 pixels wide.

### Note

The pict drawing routines are a little cumbersome. You may want to use the [image teachpack](https://docs.racket-lang.org/teachpack/2htdpimage.html) instead.
