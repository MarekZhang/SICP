(define (segments->painter segment-list) 
	(lambda (frame)
		(for-each
			(lambda (segment)
       		(draw-line
        		((frame-coord-map frame)
         		(start-segment segment))
        		((frame-coord-map frame)
         		(end-segment segment))))
     			segment-list)))

(let ((bl (make-vect 0 0))
	  (br (make-vect 1 0))
	  (tl (make-vect 0 1))
	  (tr (make-vect 1 1)))
	;a
	(segments->painter (list (make-segment bl br) (make-segment bl tl) (make-segment tl tr) (make-segment tr br)))

	;b
	(segments->painter (list (make-segment tl br) (make-segment bl tr))))

(let ((l (make-vect 0 0.5)) 
       (t (make-vect 0.5 1)) 
       (r (make-vect 1 0.5)) 
       (b (make-vect 0.5 0))) 
   ; c 
   (segments->painter (list (make-segment l t) (make-segment t r) (make-segment r b) (make-segment b l)))) 