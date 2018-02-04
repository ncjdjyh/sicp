;可以根据fliter(过滤器)只对筛选出来的数进行accumulate(累积)比1.32的accumulate更加抽象
(load "Util.rkt")
(define (filtered-accumulate fliter combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        ((fliter (term a))
         (combiner (term a)
                   (filtered-accumulate fliter
                                        combiner
                                        null-value
                                        term
                                        (next a)
                                        next
                                        b)))
        (else
         (filtered-accumulate fliter
                             combiner
                             null-value
                             term
                             (next a)
                             next
                             b))))

(define (primes-sum a b)
  (filtered-accumulate primer?
                       + 
                       0
                       (lambda (x) x)
                       a
                       (lambda (i) (+ i 1))
                       b
                       ))

(primes-sum 1 10)
(primer? 2)