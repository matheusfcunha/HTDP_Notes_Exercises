;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_37) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
;Exercise 37. http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._design4%29%29

; We use Strings to represent Words.
; We use Strings to represent Letters.
; a Word is a String.
; a Letter is a one character String;
; interpretation represents given word without first letter.
; String -> String
; Computes the given Word without first Letter.
; Given "apple", expect: "pple"
; Given "testing", expect "esting"

(define (string-rest str)
  (substring str 1 (string-length str)))

(string-rest "apple")
(string-rest "testing")