;;;; mul-sub.rkt - calculator for numbers, addition, and
;;;; Boolean if expressions.
;;;; Transcribed from the textbook
;;;; Programming Languages: Application and Interpretation
;;;; by Shriram Krishnamurthi
;;;; https://www.plai.org/
;;;; under Creative Commons CC BY-NC-SA license
;;;; https://creativecommons.org/licenses/by-nc-sa/4.0/

#lang plait

;;(+ (+ 1 2) (+ 3 4))

;;; BNF de expresiones
;;; <expr> ::= <num>
;;;            | TRUE | FALSE
;;;            | { + <expr> <expr> }
;;;            | { * <expr> <expr> }
;;;            | { - <expr> <expr> }
;;;            | { cnd <expr> <expr> <expr> }

(define-type Exp
  [numE (n : Number)]
  [boolE (b : Boolean)]
  [plusE (left : Exp) (right : Exp)]
  [cndE (test : Exp) (then : Exp) (else : Exp)])

(define-type Value
  [numV (the-number : Number)]
  [boolV (the-boolean : Boolean)])


(define e1 (plusE (plusE (numE 1) (numE 2))
      (plusE (numE 3) (numE 4))))

;; 3 + 5 + 6 + 7
(define e2 (plusE (plusE (plusE (numE 3) (numE 5)) (numE 6)) (numE 7)))

(define i1 (cndE (boolE #t) (numE 1) (numE 2)))

;; calc es el evaluador de Exp a Value
(calc : (Exp -> Value))

(define (calc e)
  (type-case Exp e
    [(numE n) (numV n)]
    [(boolE b) (boolV b)]
    [(plusE l r) (add (calc l) (calc r))]
    [(cndE c t e)
     (if (conditional-expression (calc c))
         (calc t)
         (calc e))]))

(define (conditional-expression v1)
  (type-case Value v1
    [(boolV b) b]
    [else (error 'cnd "condition is not a Boolean")]))

;; funcion auxiliar para sumar numV
(define (add l r)
  (type-case Value l
    [(numV lv)
     (type-case Value r
       [(numV rv)
        (numV (+ lv rv))]
       [else (error '+ "RHS is not a number")])]
    [else (error '+ "LHS is not a number")]))

(test (calc (numE 1)) (numV 1))

(test (calc e1) (numV 10))
(test (calc e2) (numV 21))

(define e3 `{+ {+ 1 2} {+ 3 4}})

(parse : (S-Exp -> Exp))

(define (parse s)
  (cond
    [(s-exp-number? s)
     (numE (s-exp->number s))]
    [(s-exp-symbol? s)
     (cond [(symbol=? 'TRUE (s-exp->symbol s))
            (boolE #t)]
           [(symbol=? 'FALSE (s-exp->symbol s))
            (boolE #f)])]
    [(s-exp-list? s)
     (let* ((l (s-exp->list s))
            (op (first l))
            (a1 (second l))
            (a2 (third l)))
       (cond [(symbol=? '+ (s-exp->symbol op))
              (plusE (parse a1) (parse a2))]
             [(symbol=? 'cnd (s-exp->symbol op))
              (cndE (parse a1) (parse a2) (parse (fourth l)))]
             [else (error 'parse "list is not an addition or a cnd")]))]))

(define (run s)
  (calc (parse s)))

(test (run e3) (numV 10))

(test (run `{cnd TRUE 1 2}) (numV 1))

;; Por lo menos estas pruebas deben funcionar

(test (run `{- 3 2}) (numV 1))

(test (run `{* 5 6}) (numV 30))
