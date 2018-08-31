;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_240) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 240 https://htdp.org/2018-01-06/Book/part_three.html#%28counter._sim-dd._%28exercise._ex~3anested-dd%29%29

(define-struct layer [stuff])

; An LStr is one of: 
; – String
; – (make-layer LStr)
"1"
(make-layer "1")
(make-layer (make-layer "2"))    

; An LNum is one of: 
; – Number
; – (make-layer LNum)
1
(make-layer 1)
(make-layer (make-layer 2))

; --------------------- ABSTRACT ------------------------

(define-struct layer [stuff])

; A [Layer STUFF] is one of:
; - STUFF
; (make-layer [Layer STUFF])


; [Layer String]       < LStr
"1"
(make-layer "1")
(make-layer (make-layer "2")) 

; [Layer Number]       < LNum
1
(make-layer 1)
(make-layer (make-layer 2))

