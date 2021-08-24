(define (fast-expt x n)
	(fast-expt-rec 1 x n))

(define (fast-expt-rec a b n)
	(cond ((= n 0) a)
		  ((even? n) (fast-expt-rec a (* b b) (/ n 2)))
		  (else	(fast-expt-rec (* a b) b (- n 1)))))

(define (even? n)
	(= (remainder n 2) 0))

(fast-expt 2 10)
(fast-expt 3 4)