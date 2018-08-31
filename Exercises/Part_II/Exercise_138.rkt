;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_138) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 138. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._list-sum1%29%29

; A List-of-amounts (ALOA) is one of: 
; – '()
; – (cons PositiveNumber List-of-amounts)
; Interpretation: sequences of amounts of money.
; Examples:
(define aloa-ex1 '())  ; -> 0
(define aloa-ex2  (cons 0 (cons 1 '()))) ; -> 1
(define aloa-ex3 (cons 100 (cons 200 (cons 300 '()))) ) ; -> 600


; ALOA -> PositiveNumber
; Computes the sum of ALOA
(check-expect (sum aloa-ex1) 0)
(check-expect (sum aloa-ex2) 1)
(check-expect (sum aloa-ex3) 600)

(define (sum aloa)
  (cond
    [(empty? aloa) 0]
    [(cons? aloa)  (+ (first aloa) (sum (rest aloa)))])
  )