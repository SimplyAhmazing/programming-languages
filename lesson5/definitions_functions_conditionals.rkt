#lang racket

(provide (all-defined-out))

(define x 3)  ; val x = 3
(define y (+ x 2))  ; + is a function, call it here

; this is how you define a function
(define cube1
  (lambda (x)
    (* x (* x x))))  ; def cube1(x): return x * x * x


; functions take n number of arguments in racket
(define cube2
  (lambda (x)
    (* x x x)))

; you don't always have to write lambda
(define (cube3 x)
  * x x x)


; a function w/a conditional
(define (pow1 x y)
  (if (= y 0)
      1
      (* x(pow1 x (- y 1)))))

; you can curry in racket
(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

(define three-to-the (pow2 3))

; In general racket functions have the following format
; (e0 e1...eN) where e0 is the function and e1 -> eN are the function arguments
