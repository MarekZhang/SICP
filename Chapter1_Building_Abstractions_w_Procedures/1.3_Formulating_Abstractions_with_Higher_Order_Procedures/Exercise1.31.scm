;Exercise 1.31

(define (product term a next b)
	(if (> a b)
		1
		(* (term a) (product term (next a) next b)))))

(define (factorial n)
	(product factorial-term 1 inc n)
)

(define (inc x) (+ x 1))
(define (factorial-term x) x)

(factorial 3)
(factorial 5)

; a
(define (calculate-pi n)
	(* 4.0 (product pi-term 1 inc n))
)

(define (pi-term n) 
	(define dividend 
		(cond ((even? n) (+ n 2))
			  (else (+ n 1))))
	(define divisor 
		(cond ((even? n) (+ n  1))
			  (else (+ n 2))))
	(/ dividend divisor))

(calculate-pi 100)
(calculate-pi 1000)
(calculate-pi 10000)

;b
(define (product-iter term a next b)
	(define (iter result a)
		(if (> a b)
			result
			(iter (* result (term a)) (next a))))
	(iter 1 a)
)

(define (inc x) (+ x 1))
(define (iter-term x) x)
(product-iter iter-term 1 inc 5)
