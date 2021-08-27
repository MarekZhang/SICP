(define (sum term start next end)
	(if (> start end)
		0
		(+ (term start) (sum term (next start) next end))
	)
)

(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(define (simpson-integral f a b n)
	(define h (/ (- b a) n))
	(define (yk k) (f (+ a (* k h))))
	(define (simpon-term k)
		(* (cond ((or (= k 0) (= k n)) 1)
			  ((even? k) 2)
			  (else 4)
			) 
			(yk k)
		)
	)
	(* (sum simpon-term 0 inc n) (/ h 3))
)

(simpson-integral cube 0 1.0 100)
(simpson-integral cube 0 1.0 1000)


