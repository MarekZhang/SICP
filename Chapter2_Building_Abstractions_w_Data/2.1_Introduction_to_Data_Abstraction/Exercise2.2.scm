(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (make-segment start-point end-point)
	(cons start-point end-point))

(define (segment-start segment) (car segment))

(define (segment-end segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (average x y) (/ (+ x y) 2))

(define (average-point p1 p2)
	(make-point (average (x-point p1) (x-point p2)) (average (y-point p1) (y-point p2))))

(define (midpoint-segment segment)
	(print-point (average-point (segment-start segment) (segment-end segment))))

(define point1 (make-point 1 2))
(define point2 (make-point 3 4))

(midpoint-segment (make-segment point1 point2))