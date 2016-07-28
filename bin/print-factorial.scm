(load "./factorial.scm")

(define num (string->number (list-ref *argv* 3)))

(display (factorial num)) (newline)
