Title: Comparison operators
date: 2024-09-12
category: Teaching
tags: hacking, learning
slug: teaching/grad-plang-f2024/comp

## Assignment

In class we built an interpreter and parser for numbers, addition, and Boolean values with conditionals ([eval-bool.rkt]({attach}eval-bool.rkt)).

Add `>` and `xor` to our language.
```
 <expr> ::= <num> | <bool>
            | { + <expr> <expr> }
            | { if <expr> <expr> <expr> }
            # add these operations
            | { > <expr> <expr> }
            | { xor <expr> <expr> }
```
`>` compares the first and second numeric arguments and returns true if the first number is greater than the second number.

`xor` returns the exclusive or of two Boolean arguments.

You should modify the parser to recognize `>` and `xor`, and
produce an appropriate AST. The `eval` function must also be modified to
recognize and carry out the correct operations. You should probably use auxiliary functions, like we used in `eval-bool.rkt` to perform addition (`add`), and evaluate Booleans (`boolean-decision`).

You should turn in your revised interpreter in moodle.

## Examples

The following sample tests should work, you should also include further tests.

```
(test (run `{> 2 3}) (boolV #f))
(test (run `{xor #t #f}) (boolV #t))
```
