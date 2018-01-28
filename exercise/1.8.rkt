#lang racket

;用牛顿环求立方根 

(require "1.8Util.rkt")

(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs(- (cube guess) x)) 0.01))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root x)
  (cube-root-iter 1 x))

(cube-root 2)
