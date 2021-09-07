(define nil '())

(define (fringe items)
	(cond ((null? items) nil)
		  ((not (pair? items)) (cons items nil))
		  (else (append (fringe (car items)) (fringe (cdr items))))))



(define x (list (list 1 2) (list 3 4)))
h
(fringe x)