#lang racket

; Racket has assignment statements
; (set! x e)
(define a 0)
(set! a 1)  ; 'a' will be 1 from here onwards!
; "set bang" allows us have mutations. The only time a set! is possible on a
; bindign is if that binding itself 


; This is a list in Racket. Lists always end with null
(define x (cons "hi" (cons "hey" null)))  ; '("hi" "hey") 

; A pair does is also made up of cons but does not end with null
(define y (cons 1 2))  ; '(1 . 2)


