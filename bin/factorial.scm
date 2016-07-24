(define num (string->number (list-ref *argv* 3)))

(define factorial
  (lambda (n)
    (cond
     ((= 0 n) 1)
     (#t (* n (factorial(- n 1)))))))
(display (factorial num)) (newline)
