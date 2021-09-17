(define (make-segment v-start v-end) (cons v-start v-end))

(define (start-segment segment) (car segment))

(define (end-segment segment) (cdr segment))