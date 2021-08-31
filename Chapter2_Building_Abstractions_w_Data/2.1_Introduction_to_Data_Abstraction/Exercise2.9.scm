(include "Exercise2.7.scm")

(define (width interval)
	(/ (- (upper-bound interval) (lower-bound interval)) 2))

(define interval1 (make-interval 1 5))

(define interval2 (make-interval 2 6))


(= (+ (width interval1) (width interval2)) (width (add-interval interval1 interval2)))

(= (* (width interval1) (width interval2)) (width (mul-interval interval1 interval2)))

(= (/ (width interval1) (width interval2)) (width (div-interval interval1 interval2)))