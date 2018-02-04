(load "Util.rkt")
(load "1.43.rkt")
(define dx .001)

(define (smooth f)
  (lambda (x)          ;smooth接收一个过程 返回一个过程 该过程接收一个参数x 给出参数计算出将f平滑处理后的f(x)的值
    (/ (+ (f (+ x dx)) 
          (f (- x dx))
          (f x)
          ) 3)))

((smooth square) 3)

(define (smooth-times f n)
  ((repeated smooth n) f))
  
((smooth-times square 3) 3)
