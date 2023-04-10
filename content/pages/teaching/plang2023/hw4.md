title: Tarea 4
date: 2023-04-10
category: Teaching
tags: hacking, learning
slug: teaching/plang2023/hw4
status: published

# Interpretar resta

En clase vimos un interpretador en `plait` para un lenguaje que puede representar numeros, y sumar dos expresiones:

```
#lang plait

(define-type Exp
  [num (n : Number)]
  [plus (left : Exp) (right : Exp)])

(define tres (plus (num 1) (num 2)))

(calc : (Exp -> Number))
(define (calc an-exp)
  (type-case Exp an-exp
    [(num n) n]
    [(plus l r) (+ (calc l) (calc r))]))

(test (calc (num 1)) 1)
(test (calc tres) 3)
(test (calc (num -3)) -3)
(test (calc (plus (num 1) tres)) 4)


;; parser
;; S-Exp -> Exp
(parser : (S-Exp -> Exp))
(define (parser s)
  (cond
    [(s-exp-number? s) (num (s-exp->number s))]
    [(s-exp-list? s)
     (let ([l (s-exp->list s)])
       (if (symbol=? '+
                     (s-exp->symbol (first l)))
           (plus (parser (second l)) (parser (third l)))
       (error 'parser "list not an addition")))]))

(test (parser `1) (num 1))
(test (parser `{+ 1 2}) (plus (num 1) (num 2)))

(test (parser `{+ 20000 {+ 14000 {+ 600500 10}}}) (plus (num 20000)
                                                        (plus (num 14000)
                                                              (plus (num 600500)
                                                                    (num 10)))))


(run : (S-Exp -> Number))

(define (run s)
  (calc (parser s)))

(test (run `1) 1)
(test (run `{+ 1 2}) 3)
```

A~nadan la habilidad de restar dos expresiones a este lenguaje (cuidado, este no tiene if, ni Booleanos, ni devuelve Value). Deben modificar el AST (`Exp`), el `parser`, y `calc` Cuando terminen, estas pruebas deben funcionar:

```
(test (run `{- 2 3}) -1)
(test (run `{- 1 {+ 1 0}}) 0)
```

Entreguen un archivo con su codigo racket en [UPRRP
moodle](https://online.uprrp.edu/).
