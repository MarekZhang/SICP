(define nil '())

(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))
	)
)

(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 

(define (unique-pairs n)
	(accumulate append nil 
		(map (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1)))) (enumerate-interval 2 n)))
)

(define (prime? n)
	(if (= (find-smallest-divisor n 2) n) true false)
)

(define (find-smallest-divisor n test-divisor)
	(cond ((> (* test-divisor test-divisor) n) n)
		  ((= (remainder n test-divisor) 0) test-divisor)
		  (else (find-smallest-divisor n (next test-divisor)))
	)
)

(define (next test-divisor)
	(if (= test-divisor 2) 3 (+ test-divisor 2))
)

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (prime-pairs seqs)
	(filter (lambda (pair) (prime-sum? pair)) seqs))

(prime-pairs (unique-pairs 10))