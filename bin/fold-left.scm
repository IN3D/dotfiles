(define (fold-left f init seq)
  (if (null? seq)
      init
      (fold-left f
                 (f init (car seq))
                 (cdr seq))))
