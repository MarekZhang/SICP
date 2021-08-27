;recursive
(define (f n)
	(cond ((< n 3) n)
	 	  (else (+ (f (- n 1)) (* (f (- n 2)) 2) (* (f (- n 3)) 3)))))

(f 8)

;iterative		   
(define (f n)
	(if (< n 3)
		n	
	(f_iter 2 1 0 (- n 2))))

(define (f_iter a b c count)
	(if (= count 0)
		a	
		(f_iter (+ a (* b 2) (* c 3)) a b (- count 1))))

(f 8)