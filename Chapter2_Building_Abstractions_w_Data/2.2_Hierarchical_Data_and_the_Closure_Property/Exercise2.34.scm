(include "Exercise2.33.scm")

(define (horner-eval x coefficient-sequence) 
	(accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
                 0
                 coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

;1+3x+5x^3+x^5 @ x = 2
;answer = 79