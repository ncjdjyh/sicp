#lang racket


(provide half double odd? fast-expt)

(define (+ a b)
  (cond ((= a 0) b)
        (else (+ (sub1 a) (add1 b)))))

(define (add a b)
  (cond ((= a 0) b)
        (else (add1 (+ (sub1 a) b)))))



(define (* a b)
  (cond ((= a 0) 0)
        (else (+ (* (- a 1) b) b))))


(define (double n)
  (* n 2))

(define (half n)
  (if (odd? n)
      (/ n 2)
      n))

(define (odd? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (fast-expt a n)  ;a的n次方
  (define (expt-iter v a n)
    (cond ((= n 0 ) v)
          ((odd? n)
           (expt-iter v (square a) (/ n 2)))
          (else (expt-iter (* v a) a (- n 1)))))
  (expt-iter 1 a n))









                 