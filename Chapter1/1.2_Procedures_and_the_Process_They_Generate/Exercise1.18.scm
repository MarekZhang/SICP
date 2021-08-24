(define (fast-multi a b)
	(fast-add-rec 0 a b)
)

(define (fast-add-rec n a b)
	(cond ((= b 0) n)
		  ((even? b) (fast-add-rec n (double a) (halve b)))
		  (else (fast-add-rec (+ n a) a (- b 1)))
	)
)

(define (halve n)
	(/ n 2))

(define (double n)
	(* n 2))

(define (even? n)
	(= (remainder n 2) 0))

(fast-multi 7 7)