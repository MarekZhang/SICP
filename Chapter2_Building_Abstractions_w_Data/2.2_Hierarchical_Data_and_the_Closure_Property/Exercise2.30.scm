(define nil '())

(define (square-tree tree)
	(cond ((null? tree) nil)
		  ((not (pair? tree)) (* tree tree))	
		  (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define tree1 
       (list 1
        (list 2 (list 3 4) 5)
		(list 6 7)))

(square-tree tree1)
  