;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_78) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 78. https://htdp.org/2018-01-06/Book/part_one.html#%28counter._data-uni._%28exercise._struct9%29%29

; A 1String is a String of length 1, 
; from "a" to "z", including:
; #false

(define-struct 3letter-word[l1 l2 l3])

; 3letter-word is a Structure:
; (make-3letter-word 1String 1String 1String)
