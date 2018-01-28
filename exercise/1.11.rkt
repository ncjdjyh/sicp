#lang racket
;函数f如下规则(n < 3 f(n) = n      n > 3 f(n) =  f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)) 用线性和迭代递归写出程序

;迭代
(define (fc n)
  (define (fc-iter a b c n i)
    (cond ((< n i) a)
          (else (fc-iter b
                         c
                         (+ (* 3 a) (* 2 b) c)
                         n
                         (+ 1 i)))))
  (fc-iter 0 1 2 n 0))

(fc 5)

;线性
(define (fc2 n)
  (define (fc-iter)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          ((= n 2) 2)
          (else (+ (fc2 (- n 1))
                   (* 2 (fc2 (- n 2)))
                   (* 3 (fc2 (- n 3)))))))
(fc-iter))

(fc 5)