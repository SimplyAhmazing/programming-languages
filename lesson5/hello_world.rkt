; This is a comment

#lang racket

; In racket all files are module and are therefore private.
(provide (all-defined-out))

(define s "hello")