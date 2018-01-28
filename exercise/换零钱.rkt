#lang racket
;换零钱 6块换成1 2 5有多少种情况

(define (count-change amount)
  (define (cc amount kinds-of-coins)
  (cond((= amount 0) 1)                                 ;钱数最终等于0表示有一种方法
       ((or (< amount 0) (= kinds-of-coins 0)) 0)        ;钱数最终小于0表示没有方法  ;货币种类小于0表示没有方法(比如9块钱要换成3或5元的零钱) 
       (else(+ (cc amount (- kinds-of-coins 1))         ;继续换
               (cc (- amount (coin kinds-of-coins)) kinds-of-coins)))))
  (define (coin kinds-of-coins)
    (cond((= kinds-of-coins 1) 1)
         ((= kinds-of-coins 2) 2)
         ((= kinds-of-coins 3) 5)))
(cc amount 3))

(count-change 6)
  
        