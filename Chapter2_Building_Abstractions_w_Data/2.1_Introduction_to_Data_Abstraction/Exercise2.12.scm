;Exercise 2.12
(include "Exercise2.7.scm")

(define (make-center-percent center percent)
	(let ((tolerance (/ (* center percent) 2)))
		(make-interval (- center tolerance) (+ center tolerance))))

(define (percent interval)
	(/ (- (upper-bound interval) (lower-bound interval)) (/ (+ (upper-bound interval) (lower-bound interval)) 2)))

(define (center i)
	(/ (+ (lower-bound i) (upper-bound i)) 2))

(define interval1 (make-interval 3.35 3.65))

(percent interval1)
(center interval1)
(make-center-percent 3.5 0.085714)