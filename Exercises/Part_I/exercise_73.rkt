;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_73) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 73 - https://htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._ex~3aupdater1%29%29

; n is a Number
; interpretation is, X field on posn structure.
; Posn Number -> Posn
; produces a Posn like p with n in the x field.
(check-expect (posn-up-x (make-posn 3 3) 0) (make-posn 0 3))
(define (posn-up-x p n)
  (make-posn n (posn-y p)))