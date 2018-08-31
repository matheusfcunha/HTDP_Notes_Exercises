;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_139) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 139. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._list-sum1%29%29

; A List-of-numbers is one of: 
; – '()
; – (cons Number List-of-numbers)
(define alon-ex1 '())  ; -> #true
(define alon-ex2  (cons 0 (cons 1 '()))) ; -> #false
(define alon-ex3 (cons 100 (cons 200 (cons 300 '()))) ) ; -> #true
(define alon-ex4 (cons 100 (cons -14 (cons 300 '()))) ) ; -> #false


; ALON -> Boolean
; determines whether all numbers of ALON are positive numbers or not.
(check-expect (pos? alon-ex1)  #true)
(check-expect (pos? alon-ex2)  #false)
(check-expect (pos? alon-ex3)  #true)
(check-expect (pos? alon-ex4)  #false)
(define (pos? alon) 
  (cond
    [(empty? alon) #true]
    [(cons? alon)  (and  (positive? (first alon)) (pos? (rest alon)))]
    ))