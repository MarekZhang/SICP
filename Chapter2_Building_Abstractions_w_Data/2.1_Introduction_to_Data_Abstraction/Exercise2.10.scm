(include "Exercise2.7.scm")

(define (div-interval x y)
	(if (< (* (upper-bound y) (lower-bound y)) 0)
		(error "The interval should not spans zero." y)	
		(mul-interval
		 x
		 (make-interval (/ 1.0 (upper-bound y))
		 				(/ 1.0 (lower-bound y))))))
						 

(define interval1 (make-interval 1 2))

(define interval2 (make-interval -1 11))

(div-interval interval1 interval2)
