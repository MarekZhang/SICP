(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (good_enough? guess x)
		(if (< (abs (- guess x)) tolerance)
			true
			false))
	(define (guess x)
		(let ((next (f x)))
			(if (good_enough? x next)
				next
				(guess next)
			)
		)
	)
	(guess first-guess)
)

(define (phi x) (+ 1 (/ 1 x)))

(fixed-point cos 1.0)
(fixed-point phi 1.0)
