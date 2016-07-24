(define base (string->number (list-ref *argv* 3)))
(define exponent (string->number (list-ref *argv* 4)))

(define power
  (lambda (b e)
    (cond
     ((= 0 e) 1)
     (#t (* b (power b (- e 1)))))))
(display (power base exponent)) (newline)
