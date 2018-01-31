#lang racket

(require "1.17.rkt")
(define (* a b)
  (define(*-iter v a b)
    (cond ((= b 0) v)
          ((odd? b)
           (*-iter (+ v (double b)) a (half b))) 
          (else (*-iter (+ v a) a (- b 1)))))
  (*-iter 0 a b))

(* 4 5)