(include "Exercise2.7.scm")

(define (sub-interval x y)
	(add-interval x (make-interval (- (upper-bound y)) (- (lower-bound y)))))

(sub-interval (make-interval 1 2) (make-interval 2 3))

(sub-interval (make-interval 4 (- 5)) (make-interval 1 2))