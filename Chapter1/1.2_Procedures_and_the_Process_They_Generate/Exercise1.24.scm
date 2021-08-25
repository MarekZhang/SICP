(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1))))
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

(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((fermat-test n) (fast-prime? n (- times 1)))	
		  (else false)
	)
)

(define (search-for-primes n)
	(newline)
	(display "finding three smallest prime greater than ")
	(display n)
	(newline)
	(start-searching-prime n 0 3 (real-time-clock))
)

(define (start-searching-prime n number-of-primes count start-time)
	(cond ((= number-of-primes count) (report-prime (- (real-time-clock) start-time)))
		  ((fast-prime? n 20) 
		  	(display n)
			(newline)
		  	(start-searching-prime (+ n 1) (+ number-of-primes 1) count start-time))
		  (else (start-searching-prime (+ n 1) number-of-primes count start-time))
	)
)

(define (report-prime elapsed-time)
	(display "***")
	(newline)
	(display elapsed-time)
)

(search-for-primes 1000000)	
(search-for-primes 10000000)	
(search-for-primes 100000000)	
(search-for-primes 1000000000)	