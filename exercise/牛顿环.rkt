;牛顿环
(load "Util.rkt")
(define (sqrt x)
  (newtons-method (lambda (y)
                    (- (* y y) x)) ;找平方根  (g(x) = x * x - y = 0)
                  1))

(define (newtons-transform g)  ;找到f(x)使得方程g(x)的一个解 是x |-> f(x)的不动点
  (lambda (x)
    (- x (/ (g x) ((d g) x)))))

(define dx 0.0001)

(define (d g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g)
               guess))

(sqrt 4)