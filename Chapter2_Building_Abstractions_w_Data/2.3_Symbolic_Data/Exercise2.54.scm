(define (equal? a b)
	(cond ((and (not (pair? a)) (not (pair? b))) (eq? a b))
		  ((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
		  (else #f)))

(equal? (list '(a b c)) (list '(a b c)))
(equal? (list '(a (b) c)) (list '(a b c)))
(equal? (list '(a b c)) (list '(a b)))
