;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_34) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 34. http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._design1%29%29

; We use Strings to represent Words.
; A Word is a String.
; interpretation represents first Letter from Word.
; String -> String
; Computes the first Letter from a Word.
; Given: "John", expect: "J"
; Given "apple", expect: "a"
  (define (string-first word)
              (substring word 0 1))

(string-first "John")
(string-first "apple")
