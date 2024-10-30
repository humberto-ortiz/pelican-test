;;;; eval.rkt - evaluate arithmetic expressions
;;;; Transcribed from the textbook
;;;; Programming Languages: Application and Interpretation
;;;; Copyright 2023 by Shriram Krishnamurthi
;;;; https://www.plai.org/
;;;; under Creative Commons CC BY-NC-SA license
;;;; https://creativecommons.org/licenses/by-nc-sa/4.0/
;;;;
;;;; additional code (examples and test cases)
;;;; Copyright 2024 Humberto Ortiz Zuazaga <humberto.ortiz@upr.edu>


#lang plait

;; Abstract Data Type for arithmetic expressions
(define-type Exp
  [num (n : Number)]
  [plus (left : Exp) (right : Exp)])

;; some test cases
(define p1 (plus (num 2) (num 3)))
(define p2 (plus (num 3) (num 4)))

(define p3 (plus (num 2) p1))

(define (eval e)
  ; Return the value of the expression E
  (type-case Exp e
    [(num n) n]
    [(plus l r) (+ (eval l) (eval r))]))

;; Automated tests
(test (eval p1) 5)



;;; Un parser (bueno, medio parser)

(define (parse s)
  (cond [(s-exp-number? s) (num (s-exp->number s))]
        [(s-exp-list? s)
         (let ([l (s-exp->list s)])
           (if (symbol=? '+
                         (s-exp->symbol (first l)))

               (plus (parse (second l)) (parse (third l)))

               (error 'parse "list not an addition")))]))

(test (parse `2) (num 2))
(test (parse `(+ 2 3)) (plus (num 2) (num 3)))
(test (parse `(+ (+ 2 3) 4)) (plus (plus (num 2) (num 3)) (num 4)))

(test/exn (parse `(- 2 3)) "addition")

(define (run s)
  (eval (parse s)))
