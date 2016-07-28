(load "./power.scm")
(define base (string->number (list-ref *argv* 3)))
(define exponent (string->number (list-ref *argv* 4)))
(display (power base exponent)) (newline)
