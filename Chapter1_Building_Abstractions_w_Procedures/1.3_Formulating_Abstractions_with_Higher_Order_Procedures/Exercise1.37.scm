;a

(define (cont-frac n d k)
	(define (equation count)
		(if (> count k)
			0
			(/ (n count) (+ (d count) (equation (+ count 1))))
		)
	)
	(equation 1)
)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)

;b

(define (cont-frac-iter n d k)
	(define (iter result count)
		(if (= count 0)
			result	
			(iter (/ (n count) (+ (d count) result)) (- count 1))
		)
	)
	(iter 0 k)
)

(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11)