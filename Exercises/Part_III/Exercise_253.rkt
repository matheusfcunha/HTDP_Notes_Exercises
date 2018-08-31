;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_253) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 253 https://htdp.org/2018-01-06/Book/part_three.html#%28counter._%28exercise._ex~3aarrows-dd%29%29

; [Number -> Boolean]
(number? 3)
; [Boolean String -> Boolean]
???
; [Number Number Number -> Number]
(+ 3 3 3)
; [Number -> [List-of Number]]
(list 3)
; [[List-of Number] -> Boolean]
(list? '(3))
(empty? '(3 3))