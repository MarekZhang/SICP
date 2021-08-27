(define (make-rat n d) 
	(let ((g (gcd n d)))
		(if (< (* n d) 0)
			(cons (/ (- n) g) (/ (abs d) g))	
			(cons (/ n g) (/ d g))))
		)

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
	(newline)
	(display (numer x))
	(display "/")
	(display (denom x))
)

(define (gcd x y)
	(if (= y 0)
		x	
		(gcd y (remainder x y))))

(print-rat (make-rat 12 -8))
(print-rat (make-rat -12 -8))
(print-rat (make-rat 12 8))