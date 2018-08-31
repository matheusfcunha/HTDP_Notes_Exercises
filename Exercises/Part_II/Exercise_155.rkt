;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_155) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 155. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._rd._%28exercise._rd2%29%29

(define-struct layer [color doll])
; An RD (short for Russian doll) is one of: 
; – String 
; – (make-layer String RD)
(define rd-ex1 "yellow")
(define rd-ex2 (make-layer "yellow" "green"))
(define rd-ex3 (make-layer "yellow" (make-layer "green" "red")))



; RD -> String
; consumes a Russian doll and produces a string of all colors, separated by a comma and a space.
(check-expect (inner rd-ex1) "yellow")
(check-expect (inner rd-ex2 ) "green")
(check-expect (inner rd-ex3 ) "red")
(define (inner rd)
  (cond
    [(string? rd) rd]
    [(layer? rd) (inner (layer-doll rd))]
    )
  )