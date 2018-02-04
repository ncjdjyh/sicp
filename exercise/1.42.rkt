(load "Util.rkt")
(define (compose square inc)
  (lambda (y) (square (inc y))))

((compose square inc) 6)