(include "Exercise2.33.scm")

(define nil '())

(define (count-leaves t)
	(accumulate + 0 
		(map 
			(lambda (node)
				(cond ((null? node) 0)
					  ((not (pair? node)) 1)	
					  (else (count-leaves node))
				)	
			) 
				t)))

(define tree1 (list 1 (list 2 (list 3 4) 5) (list 6 7) 10))

(count-leaves tree1)