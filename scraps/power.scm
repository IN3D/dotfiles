(define power
  (lambda (b e)
    (cond
     ((= 0 e) 1)
     (#t (* b (power b (- e 1)))))))
