(define (make-mobile left right) (list left right))

(define (make-branch length structure) (list length structure))

(define (left-branch mobile) (car mobile))

(define (right-branch mobile) (car (cdr mobile)))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (car (cdr branch)))

(define (total-weight mobile)
	(cond ((null? mobile) 0)
		  ((not (pair? mobile)) mobile)	
		  (else (+ (total-weight (branch-structure (left-branch mobile))) (total-weight (branch-structure (right-branch mobile)))))))

; (define (make-mobile left right) (cons left right))

; (define (make-branch length structure)
; 	(cons length structure))

; (define (left-branch mobile) (car mobile))

; (define (right-branch mobile) (cdr mobile)))

; (define (branch-length branch) (car branch))

; (define (branch-structure branch) (cdr branch)))


 (define m1 (make-mobile 
             (make-branch 3 25) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 4 5) 
                           (make-branch 2 10)))))

(total-weight m1)

(define (is-balanced? mobile)
	(cond ((null? mobile) #t)
		  ((not (pair? mobile)) #t)	
		  (else (and (= (* (branch-length (left-branch mobile)) (total-weight (branch-structure (left-branch mobile)))) 
		  			  (* (branch-length (right-branch mobile)) (total-weight (branch-structure (right-branch mobile)))))
					 (is-balanced? (branch-structure (left-branch mobile)))	
					 (is-balanced? (branch-structure (right-branch mobile)))))))

(is-balanced? m1)