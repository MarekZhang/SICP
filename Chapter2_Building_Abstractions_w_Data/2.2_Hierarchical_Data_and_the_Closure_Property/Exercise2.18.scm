;Exercise 2.18

(define (append list1 list2)
	(if (null? list1)
		list2	
		(cons (car list1) (append (cdr list1) list2))
	)
)
(define nil '())

(define (reverse list)
	(if (null? (cdr list))
		list
		(append (reverse (cdr list)) (cons (car list) nil))
	)
)

(define (reverse-iter list)
	(define (iter list result)
		(if (null? list)
			result		
			(iter (cdr list) (cons (car list) result))
		)	
	)
	(iter list nil)
)

(reverse (list 1 2 3 4))
(reverse-iter (list 1 2 3 4))
(reverse (list 1 2))
(reverse (list 1))
