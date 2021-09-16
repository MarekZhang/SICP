(define (split orig-placer split-placer)
	(lambda (painter n) (
		(if (= n 0)
			painter	
			(let ((smaller ((split orig-placer split-placer) painter (- n 1))))
				(orig-placer painter (split-placer smaller smaller))	
			)
		)

	))
)