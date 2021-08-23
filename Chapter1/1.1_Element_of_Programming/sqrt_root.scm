(define (sqrt x)
	(sqrt_root 1.0 x))

(define (sqrt_root guess x)
	(if (good_enough? guess x)
		guess
		(sqrt_root (improve guess x) x)))

(define (good_enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
	(avg guess (/ x guess)))

(define (avg x y)
	(/ (+ x y) 2))

(sqrt 0.0001)
(sqrt 3333333333)

