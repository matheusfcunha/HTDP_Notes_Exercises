;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_245) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 245. https://htdp.org/2018-01-06/Book/part_three.html#%28counter._%28exercise._ex~3asem2-funcs%29%29



;(define (f x) (x 10))
;(define (f x) (x f))
;(cons f '())


;(define (f x) (x 3 4))


; Fn? Fn? -> Boolean
; Given two functions from numbers to numbers,
; determines whether the two produce the same results for 1.2, 3, and -5.775
(define (function=at-1.2-3-and-5.775? x y)
  (and
   (equal? (x 1.2) (y 1.2))
   (equal? (x 3) (y 3))
   (equal? (x -5.775) (y -5.775)))) 

; Can we hope to define function=?, which determines whether two functions from numbers to numbers are equal? If so, define the function.
; If not, explain why and consider the implication that you have encountered the first easily definable idea for which you cannot define a function.

; Answer: If we consider the statement on the book: "Mathematicians say that two functions are equal if they compute the same result when given the same input—for all possible inputs.",
; then we cannot define function=? because there's no way to compare all possible inputs.