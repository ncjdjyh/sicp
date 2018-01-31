#lang racket
(define (move n from to destation)
  (cond ((= n 0) "done")
        (else
         (move (- n 1) from destation to)
         (print from)
         (print to)
         (print destation)
         (newline)
         (move (- n 1) to from destation))))

(move 3 1 2 3)