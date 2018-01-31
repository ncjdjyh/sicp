(define (square n) (* n n))
(define (cube n) (* n n n))
(define (inc n) (+ n 1))
(define (even? n) (= (remainder n 2) 0))
(define (sum-of-square x y)
  (+ (square x) (square y)))

;设置加的公共模式
(define (sum term a next b)                  ;term是设定的过程 next是下一个a的值 next是下一过程的计算   
  (cond((> a b) 0)
       (else (+ (term a)
                (sum term (next a) next b)))))

(define (sum-cube a b)
  (sum cube a inc b))

(define (sum-integer a b)
  (define (equal x) x)
  (sum equal a inc b))

;平方根
(define (sqrt x) 
   (define (sqrt-iter guess)
     (if (good-enough? guess)               ;如果不是足够好就继续猜
         (improve guess)                    
         (sqrt-iter (improve guess))))
   (define (improve guess)
     (/ (+ guess (/ x guess))2))
   (define (good-enough? guess)
     (< (abs (- (square guess) x)) 0.00001))
   (define (square x)
     (* x x))
  (sqrt-iter 1)
   )

;立方根
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




        