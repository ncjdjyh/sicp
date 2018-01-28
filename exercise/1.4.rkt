#lang racket

(define (a-plus-abs-b a b)
((if(> b 0) + -) a b)) ; if返回了加或减然后再根据是+还是-继续计算


(a-plus-abs-b 5 -3)