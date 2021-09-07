(define nil '()) 
   
(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 

(define (accumulate-n op init sequence) 
   (if (null? (car sequence)) 
       nil 
       (cons (accumulate op init (map car sequence)) 
             (accumulate-n op init (map cdr sequence))))) 

(define (dot-product v w) 
   (accumulate + 0 (map * v w))) 

(dot-product (list 1 2 3) (list 4 5 6))

; a
(define (matrix-*-vector m v)
	(map (lambda (s) (dot-product s v)) m))

(define matrix1 (list (list 1 2 3) (list 4 5 6)))
(define m1 (list 1 2 3))

(matrix-*-vector matrix1 m1)

; b
(define (transpose mat) 
	(accumulate-n cons nil mat))

(transpose matrix1)

; c
(define (matrix-*-matrix m n) 
	(let ((cols (transpose n)))
	(map (lambda (row) (matrix-*-vector cols row)) m)))

(define matrix2 (list (list 1 4) (list 2 5) (list 3 6)))

(matrix-*-matrix matrix1 matrix2)