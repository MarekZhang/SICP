(define nil '())

(define empty-board nil)

(define (enumerate-interval low high)
	(if (> low high)
		nil
		(cons low (enumerate-interval (+ low 1) high))
	)
)

(define (flatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence)))))

(define (queens board-size) 
	(define (queen-cols k)
		(if (= k 0)
			(list empty-board) 
			(filter
				(lambda (positions) (safe? k positions)) 
				(flatmap (lambda (rest-of-queens) 
					(map (lambda (new-row)
		                   (adjoin-position
		                    new-row k rest-of-queens))
		                 (enumerate-interval 1 board-size)))
		          (queen-cols (- k 1))))))
	(queen-cols board-size))

(define (adjoin-position new-row k rest-of-queens)
	(cons (list new-row k) rest-of-queens))


(define (safe? k positions)
	(let ((cords (car positions))
		 (cords-x (caar positions))	
		 (cords-y (cadar positions))
		 (rest (cdr positions)))
		 (accumulate 
		 	(lambda (prev-cords result) 
				(let ((prev-x (car prev-cords))
				      (prev-y (cadr prev-cords)))			
					 (and (not (= cords-x prev-x))
						  (not (= (abs (- cords-x prev-x)) (abs (- cords-y prev-y)))) 
						  result
					 )
				)
			 ) 
			true 
			rest)
	)
)

(queens 8)