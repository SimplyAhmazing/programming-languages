#lang racket

; in ML, Racket, Java, C
; -- function arguments are eager (call-by-value), evaluated once b4 the function call
; -- conditional branches are not eager

; Thunk delay
; We know how to delay evaluation: put the expression in a function!
; - thanks to closures, can use all the same variables

; A zero-argument function used to delay evaluation is called a Thunk

(define (my-if x y z)
  (if x (y) (z)))

(define (fact n)
  (my-if (= n 0)
         (lambda () 1)
         (lambda() (* n (fact (- n 1))))))