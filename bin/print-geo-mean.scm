(load "./str-to-num.scm")
(load "./geo-mean.scm")

(define str-nums (cdr (cdr (cdr *argv*))))
(define nums (str-to-num str-nums))

(display (geo-mean nums)) (newline)
