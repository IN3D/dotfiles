(load "./str-to-num.scm")
(load "./mean.scm")

(define str-nums (cdr (cdr (cdr *argv*))))
(define nums (str-to-num str-nums))

(display (mean nums)) (newline)
