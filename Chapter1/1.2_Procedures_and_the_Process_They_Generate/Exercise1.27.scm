(define (test-carmichael n)
	(fast-carm-test n 2)
)

(define (fast-carm-test n a)
	(cond ((= a n) true)
		  ((not (compare-modulo n a)) false)	
		  (else (fast-carm-test n (+ a 1)))
	)
)

(define (compare-modulo n a)
	(= (expmod a n n) a)
)

(define (expmod base exp m)
	(cond ((= exp 0) 1)
		  ((even? exp)
		 	(remainder
				(square (expmod base (/ exp 2) m)) 
			 m) 
		  )	
		  (else 
		  	(remainder
			 	(* base (expmod base (- exp 1) m)) 
			  m)
		  )
	)
)

(test-carmichael 561)
(test-carmichael 1105)
(test-carmichael 1729)
(test-carmichael 2465)
(test-carmichael 2821)
(test-carmichael 6601)