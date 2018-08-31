;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_254) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 254. https://htdp.org/2018-01-06/Book/part_three.html#%28counter._%28exercise._ex~3afancy-signatures1%29%29

; sort-n
; [List-of Number] (Number Number -> Boolean) -> [List-of Number]

           ....      ...    ....       ....                ....
; sort-s
; [List-of String] (String String -> Boolean) -> [List-of String]


; [X Y] [List-of X] (X X -> Y) -> [List-of X]

 

(define-struct IR
  [name price])
; An IR is a structure:
;   (make-IR String Number)


; [IR Boolean] [List-of IR] (IR IR -> Boolean) -> [List-of IR]