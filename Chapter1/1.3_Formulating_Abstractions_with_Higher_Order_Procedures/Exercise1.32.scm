;Exercise 1.32

;a
(define (accumulate combiner null-value term a next b)
	(define (iter result a)
		(if (> a b)
			result
			(iter (combiner result (term a)) (next a))
		)
	)
	(iter null-value a)
)

(define (add a b) (+ a b))
(define (prod a b) (* a b))
(define (term a) a)
(define (inc x) (+ x 1))

(accumulate add 0 term 1 inc 10)
(accumulate prod 1 term 1 inc 5)

;b
(define (accumulate-recur combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate-recur combiner null-value term (next a) next b)))
	)
)

(accumulate-recur add 0 term 1 inc 10)
(accumulate-recur prod 1 term 1 inc 5)