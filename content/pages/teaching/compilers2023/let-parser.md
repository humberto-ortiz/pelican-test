title: Lexer and parser for let expressions
date: 2023-03-07
category: Teaching
tags: hacking, learning
slug: teaching/compilers2023/let-parser
status: published

# Analisis sintactico

En [Lecture 3](https://course.ccs.neu.edu/cs4410sp22/lec_let-and-stack_notes.html#%28part._let._.Growing_the_language__adding_let%29) se anadio expresiones de identificacores y let. En clase construimos un interpretador para la let e identificadores, pero no hemos hecho el lexer y el parser.

Modifica el lexer y el parser de el compilador de [incdec](https://github.com/humberto-ortiz/compilers-2023/tree/main/incdec) para que reconozca identificadores y let.

Un `IDENTIFICADOR` comienza con una letra, y contiene letras, numeros, y los caracteres '-', '_'.

Una expression de let en nuestro lenguage debe consistir de
```
( let ( ( IDENTIFICADOR <expr> ) ) <expr> )
```

Ya modificamos `expr` en [`syntax.ml`](https://github.com/humberto-ortiz/compilers-2023/blob/main/incdec/syntax.ml).

En clase construimos un let:
```
(let ((x (inc 10)))
    (dec x))
```

Esto debe resultar en esta expression:

```
Let ("x", Inc (Num 10L),
    (Dec (Id "x")))
```

Entreguen los archivos `lexer.mll` y `parser.ml` con sus modificaciones en
[UPRRP moodle](https://online.uprrp.edu/).
