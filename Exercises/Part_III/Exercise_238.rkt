;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_238) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 238


; ?function? Nelon -> Number     (Nelon is non-empty list of numbers)
; Determines the matching number on l based on op (operator: < smallest, > largest)
(check-expect (find.v1 < '(3 5 10)) 3)
(check-expect (find.v1 > '(3 5 10)) 10)
(define (find.v1 op l)
(cond
    [(empty? (rest l))
     (first l)]
    [else
     (if (op (first l)
            (find.v1 op (rest l)))
         (first l)
         (find.v1 op (rest l)))]))

 
;(find.v1 < (list 25 24 23 22 21 20 19 18 17 16 15 14 13           Too Slow!!!
;      12 11 10 9 8 7 6 5 4 3 2 1)) 



; ?function? Nelon -> Number     (Nelon is non-empty list of numbers)
; Determines the matching number on l based on op (operator: min smallest, max largest)
(check-expect (find.v2 min '(3 5 10)) 3)
(check-expect (find.v2 max '(3 5 10)) 10)
(check-expect (find.v2 max (list 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)) 25)
(define (find.v2 op l)
(cond
    [(empty? (rest l))
     (first l)]
    [else (op (first l) (find.v2 op (rest l)))]))

