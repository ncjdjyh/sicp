
(define (square x)
  (* x x))

(define (prime-number? x)              ;从2除到(sqrt x)
  (define (prime-iter x n)
    (cond ((< x (square n))
          x)
          ((divisor? x n)
           n)
          (else
           (prime-iter x (+ n 1)))))
  (prime-iter x 2))

(define (divisor? a b)
  (= (remainder a b) 0))

(prime-number? 11)

