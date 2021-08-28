(include "Exercise2.2.scm")

(define (make-rectangle top-left bottom-right)
	(cons top-left bottom-right)
)

(define (top-left-point rectangle) (car rectangle))

(define (bottom-right-point rectangle) (cdr rectangle))

(define (top-right-point rectangle)
	(make-point (x-point (bottom-right-point rectangle)) (y-point (top-left-point rectangle))))

(define (bottom-left-point rectangle)
	(make-point (x-point (top-left-point rectangle)) (y-point (bottom-right-point rectangle))))

(define (get-width rectangle) 
	(- (y-point (top-left-point rectangle)) (y-point (bottom-left-point rectangle))))

(define (get-length rectangle) 
	(- (x-point (bottom-right-point rectangle)) (x-point (bottom-left-point rectangle))))

(define (area rectangle) 
	(* (get-width rectangle) (get-length rectangle)))

(define (perimeter rectangle) 
	(* (+ (get-width rectangle) (get-length rectangle)) 2))

(define point1 (make-point 1 4))

(define point2 (make-point 4 2))

(define rectangle1 (make-rectangle point1 point2))

(area rectangle1)
(perimeter rectangle1)