#lang racket

(define x (cons 14 null))

(define y x)

(set! x (cons 42 null))
; y = '(14) and x = '(42)

; set! creates a new x, it does not change the content of x
; set! only works on indentifiers

(define mpr (mcons 1 (mcons #t "hi")))
; (mcons 1 (mcons #t "hi"))

(set-mcdr! mpr 47)
; (mcons 1 47)

(define mpr2 (mcons 1 (mcons #t "hi")))
; (mcons 1 (mcons #t "hi"))

(set-mcar! (mcdr mpr2) 14)
; (mcons 1 (mcons 14 "hi"))