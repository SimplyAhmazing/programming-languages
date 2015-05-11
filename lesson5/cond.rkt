#lang racket

;; Cond

; General syntax,
; (cond [e1a e1b]
;       [e2a e2b]
;       ....
;       [eNa e2b])

; Good style, make the last expression default to true
; e.g. [#t <something>]


(provide (all-defined-out))

; A sum function that will return the sum of a list or the
; sum of a list of lists
(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [(list? xs) (sum3 (car xs))]
        [#t (sum3 (car xs))]
        ))

; In racket, anything that is not #f is considered to be true
; this feature doesn't make sense in a statically typed language

(if 10 "True" "False")  ; this will always return "True" because 19 != #f

