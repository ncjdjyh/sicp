;构建加的乘都能使用的更抽象的过程
(define (accumulate combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        (else
         (combiner (term a)
                   (accumulate combiner
                    null-value
                    term
                    (next a)
                    next
                    b)))))
;重新定义sum
(define (sum term a next b)
  (accumulate  +
               0
               term
               a
               next
               b))
;重新定义product
(define (product term a next b)
    (accumulate *
                1 
                term
                a
                next
                b))

;测试用sum构建从1 +'''''+10
(sum (lambda (x) x)
     1
     (lambda (x) (+ x 1))
     10)
       