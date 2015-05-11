#lang racket

; this is how you implement lazy evaluation in Racket

; We creat a function which creates an ADT w/a thunk in the 2nd position
; and a boolean that represents whehter or not that thunk was evaulated in
; the first position

(define (my-delay th)
  (mcons #f th))

; We then create a function that calls the thunk and caches it or
; returns the cached value

(define (my-force p)
  (if (mcar p)
      (mcdr p)
      (begin (set-mcar! p #t)
             (set-mcdr! p ((mcdr p)))
             (mcdr p))))

; this is also called a promise

(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

; NOTE: NEED TO IMPLEMENT SLOW ADD...
(display (my-mult 4 (let ([p (my-delay (lambda () (slow-add 3 4)))])
                      (lambda () (my-force p)))))
