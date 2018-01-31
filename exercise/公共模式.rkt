(define (sum-integer a b)
  (cond ((> a b) 0)
        (else (+ a
                 (sum-integer (+ a 1) b)))))

(define (cube n) (* n n n))
(define (inc n) (+ n 1))
(define (even? n) (= (remainder n 2) 0))

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

(sum-cube 1 10)
(sum-integer 1 10)

;求定积分   f是使用的函数方程 a b是上下限
(define (integral f a b dx)
  (define (add-dx n) (+ n dx))
  (* dx (sum f a add-dx b)))

(integral cube 0 1 0.001)


(define (sum-of-cube a b)
  (define (inc n) (+ n 1))
  (sum cube a inc b))
(sum-of-cube 1 10)





        