(define (over-or-under num1 num2) 

(cond
  ((< num1 num2) -1) 
  ((> num1 num2) 1)
  (else 0))
)


(define (make-adder num) (lambda (inc) (+ inc num)))

(define (composed f g) (lambda (x) (f (g x))))

(define (helper f) (lambda (f) (f f)))

(define (repeat f n)

(
  cond
  ((= n 1) (lambda (x) (f x)))
  ; ((= n 2) (composed f f))
  ((> n 1) (repeat (composed f f) (- n 1)))


)


)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 'YOUR-CODE-HERE)
