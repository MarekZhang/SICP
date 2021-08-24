(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n divisor)
	(cond ((> (* divisor divisor) n) n)
		  ((= (remainder n divisor) 0) divisor)	
		  (else (find-divisor n (+ divisor 1)))
	)
)

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)