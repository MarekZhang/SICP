(define (sum term a next b)
	(if (> a b)
		0	
		(+ (term a) (sum term (next a) next b))
	)
)

(define (inc c) (+ c 1))

(sum square 1 inc 3)