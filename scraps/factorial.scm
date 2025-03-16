(define factorial
  (lambda (n)
    (cond
     ((= 0 n) 1)
     (#t (* n (factorial(- n 1)))))))
