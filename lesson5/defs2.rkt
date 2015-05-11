#lang racket

; Empty list: null
; Cons constructor: cons
; Access head of list: car
; Access tail of list: cdr
; check for empty: null?

; Notes - unlike scheme, () doesn't work for null but '() does...
; (list e1 .. eN) for building lists
; Names car and cdr are historical


; sum all the numbers in a list
(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))

; usage: (sum (list 1 2 3 4))

; the append function implementation
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

 
; map function implementation
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs))
            (my-map f (cdr xs)))))