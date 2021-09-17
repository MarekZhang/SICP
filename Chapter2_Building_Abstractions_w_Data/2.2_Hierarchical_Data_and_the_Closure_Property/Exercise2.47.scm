(define (make-frame origin edge1 edge2) (list origin edge1 edge2))
(define (origin-vector frame) (car frame))
(define (edge1-vector frame) (cadr frame))
(define (edge2-vector frame) (caddr frame))

(define (make-frame origin edge1 edge2) (cons origin (cons edge1 edge2)))
(define (origin-vector frame) (car frame))
(define (edge1-vector frame) (cadr frame))
(define (edge2-vector frame) (cddr frame))
