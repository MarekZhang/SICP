; Exercise 1.40
(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (good-enought? guess next)
		(if (< (abs (- guess next)) tolerance)
			true
			false))
	(define (try guess)
		(let ((next (f guess)))
			(if (good-enought? guess next)
				next
				(try next))))
	(try first-guess)
)

(define dx 0.00001)

(define (deriv g)
	(lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
	(lambda (x) (- x (/ (g x) ((deriv g) x))))
)

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (cubic a b c)
	(lambda (x) (+ (cube x) (* a (square x)) (* b x) c)))

(newtons-method (cubic 1 2 3) 1)