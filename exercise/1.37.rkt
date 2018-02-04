(load "Util.rkt")
(define (cont-frac n d k)
  (cond ((= k 0)
         0)
         (else (/ n
                  (+ d
                     (cont-frac
                      n
                      d
                      (- k 1)))))))

(cont-frac 1 1 10)


                
        
