#lang racket

;牛顿环求平方根

(define (sqrt-iter guess x)
  (if (good-enough?? guess (improve guess x))               ;如果不是足够好就继续猜
      (improve guess x)                    
  (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ guess (/ x guess))2))
 
(define (good-enough? guess x)
   (< (abs (- (square guess) x)) 0.00001))

(define (good-enough?? old-guess new-guess)
    (> 0.01
       (/ (abs (- new-guess old-guess))
          old-guess)))

(define (square x)
  (* x x))
 (define (sqrt x)
  (sqrt-iter 1 x))

(sqrt 900)

;黑箱抽象
(define (black-sqrt x) 
   (define (sqrt-iter guess)
     (if (good-enough? guess)               ;如果不是足够好就继续猜
         (improve guess)                    
         (sqrt-iter (improve guess))))
   (define (improve guess)
     (/ (+ guess (/ x guess))2))
   (define (good-enough? guess)
     (< (abs (- (square guess) x)) 0.00001))
   (define (square x)
     (* x x))
  (sqrt-iter 1)
   )

(black-sqrt 9)




