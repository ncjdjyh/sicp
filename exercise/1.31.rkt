(load "Util.rkt")

(define (product term a next b)    
  (cond ((> a b) 1)
        (else
         (* (term a)
            (product
             term
             (next a)
             next
             b)))))

(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (product term 1 next n))

(factorial 10)

(define (pi n) ;控制精准度
  (define (numer-term i)
    (cond
      ((= i 1) 2)
      ((even? i)
           (+ i 2))
          (else
            (+ i 1))))
  (define (denom-term i)
    (if (odd? i)
        (+ i 2)
        (+ i 1)))
  
     (* 4
           (/ (product numer-term
                        1
                        (lambda (i) (+ i 1))
                        n)
               (product denom-term 
                        1
                        (lambda (i) (+ i 1))
                        n))))

(pi 100)


  





  