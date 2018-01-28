#lang racket

;求帕斯卡某行某列的值
  (define (psk-iter i n)
    (cond ((= i 1) 1)
          ((= n 0) 0)
          ((= n i) 1)
          (else(+ (psk-iter (- i 1) (- n 1))
              (psk-iter i (- n 1))))))
  (psk-iter 2 4)




 