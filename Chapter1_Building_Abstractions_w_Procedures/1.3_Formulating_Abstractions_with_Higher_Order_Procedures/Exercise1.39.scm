;Exercise 1.39

(define (tan-cf x k)
	(define (n x i)
		(if (= i 1)
			x
			(* x x)))
	(define (d i) (- (* 2 i) 1))
	(define (tan-recur x k count)
		(if (= count k)
			0
			(/ (n x count) (- (d count) (tan-recur x k (+ count 1))))))
	
	(tan-recur x k 1)
)

(tan-cf (/ 3.1415926 4) 1000)