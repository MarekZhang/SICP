;Exercise 1.33
(define (filtered-accumulate combiner null-value term a next b filter)
	(if (or (> a b))
		null-value
		(if (filter a)
			(combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter))
			(combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter))
		)
	)
)

;a 
(define (prime? n)
	(if (= (find-smallest-divisor n 2) n) true false)
)

(define (find-smallest-divisor n test-divisor)
	(cond ((> (* test-divisor test-divisor) n) n)
		  ((= (remainder n test-divisor) 0) test-divisor)
		  (else (find-smallest-divisor n (+ test-divisor 1)))
	)
)

(define (add a b) (+ a b))
(define (prod a b) (* a b))
(define (square a) (* a a))
(define (inc x) (+ x 1))

(filtered-accumulate add 0 square 2 inc 10 prime?)

;b
(define (gcd m n)
	(cond ((> n m) (gcd n m))
		  ((= n 0) m)
		  (else (gcd n (remainder m n)))))

(define (relative-prime-to-n n)
	(define (prime-to-n? m)
		(= (gcd n m) 1)
	)
	(define (itself x) x)
	(filtered-accumulate prod 1 itself 1 inc n prime-to-n?)
)

(relative-prime-to-n 10)
;189