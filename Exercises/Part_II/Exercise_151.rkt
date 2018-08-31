;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_151) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 151 https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._n3%29%29

; An N is one of: 
; – 0
; – (add1 N)
; interpretation represents the counting numbers

; N Number -> Number
; adds n to x without using +
(define (add n x)
  (cond
    [(zero? n) x]
    [(positive? n)  (add1 (add (sub1 n) x)) ]
     
    ))

; N Number -> Number
; Multiplies n by x without using *
;(check-expect (multiply 3 0) 0)
;(check-expect (multiply 0 3) 0)
;(check-expect (multiply 3 2) 6)
;(check-expect (multiply 2 3) 6)
;(check-expect (multiply 10 10) 100)
(define (multiply n x)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ (multiply (sub1 n) x) x)]
    
    ))

(multiply 5 3)


