(load "Util.rkt")
 (define (repeated f n)
   (if (= n 1) f
       (lambda (x) (f ((repeated f (- n 1))
                    x)))))
 
 ((repeated square 2)5)

 (define (fast-repeated f n)
   (define (repeated-iter r count)
     (cond ((= count n)
            r)
           (else
            (repeated-iter (f r)
                          (+ count 1)))))
           (lambda (x) (repeated-iter x 0)))
 
 ((fast-repeated square 2) 5)

 (define (repeated2 f n)
   (define (loop n v)
     (if (= n 1 ) (f v)
         (f (loop (- n 1) v))))
   (lambda (x) (loop n x)))

  ((repeated2 square 2) 5)


(define (repeated f n)
    (define (iter i repeated-f)
        (if (= i 1)
            repeated-f
            (iter (- i 1)
                  (lambda (x)
                      (f (repeated-f x))))))
    (iter n f))

((repeated square 2) 5)




       