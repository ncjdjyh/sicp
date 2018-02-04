(load "Util.rkt")

(define (xps1 f a b n)
  (define (h)
    (/ (- b a) n))
  (define (term k)
    (define (factor)
    (cond ((or (= k 0) (= k n)) 1)
          ((even? k) 4)
          (else 2)))
    (define (y)
      (f (+ a (* k (h)))))
    (* (factor) (y)))
  (define (next k)
    (+ k 1))
  (* (/ (h) 3)
     (sum term 0 next n)))   ;sum过程做的就是y(0)+4*y(1) + 2*y(2) + 4*y(3) + 2*y(4)+```+y(n)   从y(k)加到y(n)

(xps1 cube 0 1 10000)


    
  
    