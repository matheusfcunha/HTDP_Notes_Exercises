;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_72) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct phone [area number])
; a Phone is a structure:
; (make-phone Number Number)
; interpretation is, phone number area code, phone number.

(define-struct phone# [area switch num])
; a Phone# is a structure:
; (make-phone Number Number Number)
; Area is between    000 - 999  interpretation is area code of the phone number.
; Switch is between  000 - 999  interpretation is code for the phone exchange of your neighborhood.
; Num is between    0000 - 9999 interpretation is phone number in respect to neighborhood.