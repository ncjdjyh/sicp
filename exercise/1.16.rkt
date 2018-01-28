#lang racket



(define (square x)
  (* x x))


(define (fast-exp n p)
  (cond ((= p 0) 1)
        ((odd? p)
         (square (fast-exp n (/ p 2))))
        (else(* n (fast-exp n ( - p 1))))))

(define (odd? n)
  (= (remainder n 2) 0))

(fast-exp 2 5)


(define (fast-exp1 n p)
  (define (exp-iter v n p )
    (cond((= p 0) v)
         ((odd? p)
          (exp-iter
           v
           (square n)
           (/ p 2)))
         (else
          (exp-iter
               (* v n)
               n
               (- p 1)))))
  (exp-iter 1 n p))

(fast-exp1 2 6)
