(define nil '())

(define (square-list-1 items)
	(if (null? items)
		nil	
		(cons (* (car items) (car items)) (square-list-1 (cdr items)))))

(square-list-1 (list 1 2 3 4))

(define (square-list-2 items)
	(map (lambda (x) (* x x)) items))

(square-list-2 (list 1 2 3 4))