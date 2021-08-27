(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (good-enought? guess next)
		(if (< (abs (- guess next)) tolerance)
			true
			false))
	(define (try guess)
		(display guess)
		(newline)
		(let ((next (f guess)))
			(if (good-enought? guess next)
				next
				(try next))))
	(try first-guess)
)

(define (function x)
	(/ (log 1000) (log x)))

(fixed-point cos 1.0)
(fixed-point function 2.0)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 10.0)