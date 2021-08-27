;Exercise 1.38

(define (cont-frac n d k)
	(define (equation count)
		(if (> count k)
			0
			(/ (n count) (+ (d count) (equation (+ count 1))))
		)
	)
	(equation 1)
)

(define (di i)
	(cond ((= (remainder i 3) 0) 1)
		  ((= (remainder (- i 1) 3) 0) 1)
		  (else (+ (* (quotient i 3) 2) 2))))

(cont-frac (lambda (i) 1.0) di 1000)