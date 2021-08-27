(define (iterative-improve good-enough? improve-guess)
	(lambda(guess)
		(if (good-enough? guess)
			 guess	
			 ((iterative-improve good-enough? improve-guess) (improve-guess guess))
		)	
	)
)

(define tolerance 0.00001)

(define (sqrt x)
	(
		(iterative-improve 
		(lambda (guess) (< (abs (- (* guess guess) x)) tolerance)) 
		(lambda (y) (average y (/ x y)))	
		) 
		1.0
	)
)

(define (average x y)
	(/ (+ x y) 2))

(sqrt 2)

(define (criterion x y)
	(< (abs (- x y)) tolerance))

(define (fixed-point f first-guess)
	((iterative-improve
	 (lambda (guess) (criterion guess (f guess)))
	 f)
	 first-guess))

(fixed-point cos 1.0)