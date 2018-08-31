;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_150) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 150. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._n2%29%29

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers


; N -> Number
; computes (+ n pi) without using +
;(check-within (add-to-pi 3) (+ 3 pi) 0.001)
(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [(positive? n)  (add1 (add-to-pi (sub1 n))) ]
    
    ))


(add-to-pi 2)

; N Number -> Number
; adds n to x without using +
(define (add n x)
  (cond
    [(zero? n) x]
    [(positive? n)  (add1 (add (sub1 n) x)) ]
     
    ))