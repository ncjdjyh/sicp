#lang racket

;线性递归(前n项乘积)
(define (mut-iter n)
(if (= n 1) 1
    (* n (mut-iter (- n 1)))))

(mut-iter 5)

(define (mut n)
  (mut-iter 1 1 n))

;迭代递归(前n项的乘积)
(define (mut2 n)
  (define (mut-iter a b n)
    (if (< n b)
        a
        (mut-iter (* a b) (+ b 1) n)))
  (mut-iter 1 2 n))

(mut2 5)

;树形递归(fib数前n项 不太好)
(define (fib n)
  (cond ((= n 0) 0)
      ((= n 1) 1)
      (else (+ (fib (- n 1))
                    (fib (- n 2))))))
      
(fib 5)

;fib的迭代递归
(define (fib2 n)
  (define(fib-iter a b count i)
    (cond((< n i) a)
         (else (fib-iter b (+ a b) count (+ i 1)))))
(fib-iter 0 1 n 1))

(fib2 5)


















   
               