(define (make-mobile left right) 
   (list left right)) 
 (define (left-branch mobile) 
   (car mobile)) 
 (define (right-branch mobile) 
   (car (cdr mobile))) 
  
 (define (make-branch length structure) 
   (list length structure)) 
 (define (branch-length branch) 
   (car branch)) 
 (define (branch-structure branch) 
   (car (cdr branch))) 
  
 ;; Redefinition of constructors and selectors 
  
  
 (define (total-weight m) 
   (cond ((null? m) 0) 
         ((not (pair? m)) m) 
         (else (+ (total-weight (branch-structure (left-branch  m))) 
                  (total-weight (branch-structure (right-branch m))))))) 
  
 (define m1 (make-mobile 
             (make-branch 4 6) 
             (make-branch 5 
                          (make-mobile 
                           (make-branch 3 7) 
                           (make-branch 9 8))))) 
  
 ;;          4  |  5 
 ;;        +----+-----+ 
 ;;        6        3 |     9 
 ;;               +---+---------+ 
 ;;               7             8 
  
(total-weight m1) 
 ;  Value: 21 
 