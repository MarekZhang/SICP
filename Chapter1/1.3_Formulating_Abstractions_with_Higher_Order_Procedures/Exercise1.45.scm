(define (average-damp f)
	(lambda (x) (/ (+ x (f x)) 2)))

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

(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated f n)
	(if (< n 1)
		(lambda (x) x)	
		(compose f (repeated f (- n 1)))))

(define (sqrt x)
	(fixed-point (average-damp (lambda (y) (/ x y))) 1.0)
)

(define (4th-root x)
	(fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y)))) 1.0)
)

(define (5th-root x)
	(fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y)))) 1.0)
)

(define (6th-root x)
	(fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y)))) 1.0)
)

(define (7th-root x)
	(fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y y)))) 1.0)
)

(define (8th-root x)
	(fixed-point ((repeated average-damp 3) (lambda (y) (/ x (* y y y y y y y)))) 1.0)
)

(define (nth-root n x)
	(fixed-point ((repeated average-damp (repeat-times n)) (lambda (y) (/ x (repeat-exp y n)))) 1.0))

(define (repeat-times n)
	(floor (/ (log n) (log 2)))
)
(define (repeat-exp y n)
	(if (< n 2)
		1	
		(* y (repeat-exp y (- n 1)))))

(4th-root 16)
(5th-root 32)
(6th-root 64)
(7th-root 128)
(8th-root 256)

(nth-root 8 256)
(nth-root 4 625)