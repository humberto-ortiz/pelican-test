;;;; eval-bool.rkt - evaluate arithmetic and Boolean expressions and conditionals.
;;;; Transcribed from the textbook
;;;; Programming Languages: Application and Interpretation
;;;; Copyright 2023 by Shriram Krishnamurthi
;;;; https://www.plai.org/
;;;; under Creative Commons CC BY-NC-SA license
;;;; https://creativecommons.org/licenses/by-nc-sa/4.0/
;;;;
;;;; additional code
;;;; Copyright 2024 Humberto Ortiz Zuazaga <humberto.ortiz@upr.edu>


#lang plait

;; Abstract Data Type for arithmetic expressions
(define-type Exp
  [boolE (b : Boolean)]
  [numE (n : Number)]
  [plusE(left : Exp) (right : Exp)]
  [cndE (c : Exp) (t : Exp) (e : Exp)])

;; Data type for returned values from evaluator
(define-type Value
  [boolV (b : Boolean)]
  [numV (n : Number)])

;; A test conditional
(define c1 (cndE (numE 1) (numE 2) (numE 3)))

;; some test cases
(define p1 (plusE (numE 2) (numE 3)))
(define p2 (plusE (numE 3) (numE 4)))

(define p3 (plusE (numE 2) p1))

;; helper function to add two numeric values, checking types
(define (add v1 v2)
  (type-case Value v1
    [(numV n1)
     (type-case Value v2
       [(numV n2) (numV (+ n1 n2))]
       [else (error '+ "RHS is not a number")])]
     [else (error '+ "LHS is not a number")]))

;; helper function to extract Boolean from a Value
(define (boolean-decision v)
  (type-case Value v
    [(boolV b) b]
    [else (error 'if "If expects a Boolean value")]))
  
(eval : (Exp -> Value))
(define (eval e)
  ; Return the value of the expression E
  (type-case Exp e
    [(boolE b) (boolV b)]
    [(numE n) (numV n)]
    [(plusE l r) (add (eval l) (eval r))]
    [(cndE c t e)
     (if (boolean-decision (eval c))
         (eval t)
         (eval e))]))

;;; Un parser (bueno, medio parser)

(define (parse s)
  (cond [(s-exp-number? s) (numE (s-exp->number s))]
        [(s-exp-boolean? s) (boolE (s-exp->boolean s))]
        [(s-exp-list? s)
         (let ([l (s-exp->list s)])
           (cond [(symbol=? '+
                         (s-exp->symbol (first l)))

               (plusE (parse (second l)) (parse (third l)))]
                 [(symbol=? 'if
                            (s-exp->symbol (first l)))
                  (cndE (parse (second l))
                       (parse (third l))
                       (parse (fourth l)))]
                 [else
                  (error 'parse (string-append
                                 "invalid operation: "
                                 (symbol->string
                                  (s-exp->symbol (first l)))))]))]))
;; parse and evaluate a s-exp
(define (run s)
  (eval (parse s)))


;;(test (parse `2) (numE 2))
;(test (parse `(+ 2 3)) (plusE (numE 2) (numE 3)))
;(test (parse `(+ (+ 2 3) 4)) (plusE (plusE (numE 2) (numE 3)) (numE 4)))

;(test/exn (parse `(- 2 3)) "addition")

;; Automated tests
(test (eval p1) (numV 5))

;; esta ya no sirve, la condicion debe ser Booleana
(test/exn (run `{if 1 2 3}) "Boolean")

(test (run `{if #t 1 2}) (numV 1))
