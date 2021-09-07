(include "Exercise2.33.scm")


(define (accumulate-n op init seqs) 
	(define nil '())

	(if (null? (car seqs))
		nil
		(cons (accumulate op init (map (lambda (s) (car s)) seqs))
			  (accumulate-n op init (map (lambda (s) (cdr s)) seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(map (lambda (s) (cdr s)) s)
