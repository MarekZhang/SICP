(define (pascal_ele x y)
	(cond ((= y 1) 1)
		  ((= x y) 1)	
		  (else (+ (pascal_ele (- x 1) y) (pascal_ele (- x 1) (- y 1))))))

(pascal_ele 1 1)
(pascal_ele 4 2)
(pascal_ele 5 3)
(pascal_ele 5 2)