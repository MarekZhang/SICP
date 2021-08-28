(define (exp base exponent)
	(define (iter n)
		(if (< n 1)
			1	
			(* base (iter (- n 1)))))
	(iter exponent)
)

(define (cons a b)
	(* (exp 2 a) (exp 3 b)))
	
(define (car x) (iter-div x 2))

(define (cdr x) (iter-div x 3))

(define (iter-div x base)
	(if (= (remainder x base) 0)
		(+ 1 (iter-div (/ x base) base))
		0	
	)	
)

(car (cons 11 12))
(cdr (cons 11 12))