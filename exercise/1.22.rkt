
(define (prime? n)
  (fast-prime? n 10))

(define (even? n)
  (= (remainder n 2) 0))

(define (fermat-test? n)
  (define (try-it r)            ;随机尝试一个数
    (= r (exp-mod r n n)))
  (try-it (+ 1 (random (- n 1)))))

(define (square x)
  (* x x))

(define (exp-mod n exp mod)
  (cond ((= exp 0) 1)
        ((even? exp)
         (exp-mod (square n) (/ exp 2) mod))
         (else
          (remainder (* n(exp-mod n (- exp 1) mod)) mod))))   
  
(define (fast-prime? n times)   ;指定times次如果仍然成立就说明他是素数
  (cond ((= times 0) true)
        ((fermat-test? n) (fast-prime? n (- times 1)))
        (else
         false)))

(define (timed-prime-test n count)        ;(runtime是程序的运行时间)  (timed-prime-test)是求出求一个数是否是素数所花费的时间
  (start-prime-test n count (runtime)))

(define (start-prime-test n count start-time)
  (search-for-primes n count)
   (report-prime (- (runtime) start-time)))

(define (report-prime elapsed-time)
  (display "***")
  (display elapsed-time))

(define (next-odd n)
  (cond ((= (remainder n 2) 0)
         (+ n 1))
        (else
         (+ n 2))))

(define (search-for-primes n count)
  (cond ((= count 0) (display "done"))
        ((prime? n)
         (display n)
         (newline)
         (search-for-primes
          (next-odd n)
          (- count 1)))
        (else
         (search-for-primes
          (next-odd n)
          count))))

(timed-prime-test 100000 3)












  
