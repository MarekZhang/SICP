;Exercise 2.20

(define nil '())

(define (append list1 list2)
	(if (null? list1)
		list2	
		(cons (car list1) (append (cdr list1) list2))
	)
)

(define (same-parity x . y)
	(define (iter list result)
		(if (null? list)
			result	
			(if (same-parity? x (car list))
				(iter (cdr list) (append result (cons (car list) nil)))	
				(iter (cdr list) result)	
			)
		)	
	)
	(iter y (list x))
)

(define (same-parity? x y)
	(= (remainder x 2) (remainder y 2))
)

(same-parity 1 2 3 4 7 2 0 9)

(same-parity 2 3 4 5 6 7 8)