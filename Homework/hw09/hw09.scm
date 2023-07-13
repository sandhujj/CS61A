(define (ascending? asc-lst) 
  (cond
    ((or (null? asc-lst) (null? (cdr asc-lst))) #t)
    ((<= (car asc-lst) (car (cdr asc-lst))) 
      (ascending? (cdr asc-lst)))
    (else #f)
  )
)

    
 
(define (my-filter pred s) 

    (if (null? s)
    s
    (if (pred (car s))
    (cons (car s) (my-filter pred (cdr s)))
    (my-filter pred (cdr s))))
    
    
)


(define (interleave lst1 lst2) 
    (if (null? lst1) lst2
    (cons (car lst1) (interleave lst2 (cdr lst1))))
)


(define (no-repeats lst)

(if (null? lst) lst
        (cons (car lst) (no-repeats (my-filter (lambda (x) (not (= x (car lst)))) lst))))
)


                        


