(load "./fold-left.scm")

(define (mean seq)
  (/ (fold-left + 0 seq) (length seq)))
