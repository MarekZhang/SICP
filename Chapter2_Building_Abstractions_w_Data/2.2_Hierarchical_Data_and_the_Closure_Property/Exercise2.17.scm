(define (last-pair list-ele)
	(if (null? (cdr list-ele))
		list-ele	
		(last-pair (cdr list-ele))))

(define list1 (list 1 2 3 4 5))
(define list2 (list 1 2))
(define list3 (list))

(last-pair list1)
(last-pair list2)
(last-pair list3)