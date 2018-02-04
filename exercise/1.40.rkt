(load "牛顿环.rkt")
(define (cubic a b c )
  (newtons-method (lambda (x)
                    (+ (cube x)
                        (* a (square x))
                        (* b x)
                        c)) 1))

(cubic 3 2 1)