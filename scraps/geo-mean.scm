(load "./fold-left.scm")

(define (geo-mean seq)
  (expt (fold-left * 1 seq) (/ 1 (length seq))))
