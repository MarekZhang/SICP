(define nil '())

(define (for-each proc items)
	(let (cdr-itmes (cdr items))
		(proc (car items))	
		(if (not (null? cdr-items))
			(for-each proc cdr-items))))

(for-each (lambda (x)
			(newline)
			(display x))
			(list 57 321 88))