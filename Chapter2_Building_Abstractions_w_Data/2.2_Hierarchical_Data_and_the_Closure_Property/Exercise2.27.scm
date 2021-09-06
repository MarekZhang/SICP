(define nil '())

(define (deep-reverse items)
	(cond ((null? items) nil)
		  ((pair? (car items)) 
		   (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))	
		  (else (append (deep-reverse (cdr items)) (list (car items))))))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)
;((4 3) (2 1))