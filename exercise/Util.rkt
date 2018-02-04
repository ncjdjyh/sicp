(define (square n) (* n n))  ;平方
(define (cube n) (* n n n))  ;立方
(define (inc n) (+ n 1))
(define (even? n) (= (remainder n 2) 0)) ;奇数
(define (odd? n) (= (remainder n 2) 1))  ;偶数
(define (sum-of-square x y)              ;平方和
  (+ (square x) (square y)))
(define (average a b) (/ (+ a b) 2))             ;平均数

;判断是否是素数
(define (prime? x)              ;从2除到(sqrt x)
  (define (prime-iter x n)
    (cond ((< x (square n))
          #t)
          ((divisor? x n)
           #f)
          (else
           (prime-iter x (+ n 1)))))
(define (divisor? a b)
  (= (remainder a b) 0))
  (prime-iter x 2))

;打印日志
 (define (info value count)
   (display "step:")
   (display count)
   (display "  ")
   (display "value:")
   (display value)
   (newline))

;判断是足够小
 (define tonerant 0.0001)
 
;求不动点
(define (fixed-point f first)
  (define (close-enough? a b)
    (< (abs (- a b)) tonerant))
  (define (try guess count)
    (let ((next (f guess)))
      (info guess count)
    (if (close-enough? guess next)
         next
        (try next (+ count 1)))))
  (try first 0))

(define (average-damp f)
  (lambda (x) (average (f x) x)))

((average-damp square)10)
;设置加的递归公共模式
(define (sum term a next b)                  ;term是设定的过程 next是下一个a的值 next是下一过程的计算   
  (cond((> a b) 0)
       (else
        (+ (term a)
           (sum term (next a) next b)))))

;设置加的迭代的公共模式
(define (fast-sum term a next b)
  (define (sum-iter r a)
    (cond ((> a b) r)
          (else (sum-iter (+ r (term a))
                          (next a)))))
    (sum-iter 0 a))

;设置乘的递归公共模式
(define (product term a next b)    
  (cond ((> a b) 1)
        (else
         (* (term a)
            (product
             term
             (next a)
             next
             b)))))


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




        