(define (larger-square x y z)
  (cond ((and (> x z) (> y z)) (+ (* x x) (* y y))) 
  		  ((and (> x y) (> z y)) (+ (* x x) (* z z)))
  		  ((and (> y x) (> z x)) (+ (* z z) (* y y)))))

(larger-square 1 2 3)
(larger-square 2 1 3)
(larger-square 3 2 1)
