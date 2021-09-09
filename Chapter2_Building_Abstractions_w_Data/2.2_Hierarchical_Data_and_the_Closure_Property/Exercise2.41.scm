(define nil '())

(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))
	)
)

(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 

(define (unique-pairs n)
	(accumulate append nil 
		(map (lambda (x) (map (lambda (y) (list x y)) (enumerate-interval 1 (- x 1)))) (enumerate-interval 2 n)))
)

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (unique-triples n)
	(accumulate append nil 
		(map (lambda (x) (flatmap (lambda (y) (map (lambda (z) (list z y x)) (enumerate-interval 1 (- y 1)))) (enumerate-interval 1 (- x 1)))) (enumerate-interval 1 n)))
)

(define (sum-less-or-equal? triple n)
	(<= (+ (car triple) (cadr triple) (car (cdr (cdr triple)))) n))

(filter (lambda (triple) (sum-less-or-equal? triple 8)) (unique-triples 4))
