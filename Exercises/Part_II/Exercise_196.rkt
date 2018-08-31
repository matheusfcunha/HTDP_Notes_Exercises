;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_196) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 196 https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._ex~3adictionary2%29%29

(define LOCATION "words")

; A List-of-strings is one of:
; - '()
; - (cons String List-of-strings)

; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines LOCATION))

; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))

; a Letter-Count is a Structure
(define-struct letter-count [letter count])
; (make-letter-count Letter Number)
; interpretation (letter-count l c)
; c is the number of l's somewhere.

(define (starts-with# letter dict)
  (cond
    [(member? letter LETTERS)
     (cond
       [(empty? dict) 0]
       [(cons? dict)  (if (equal? (string-ith (first dict) 0) letter) 
                          (+ (starts-with# letter (rest dict)) 1)
                          (starts-with# letter (rest dict)))]
       )]
    [else (error "starts-with#: Expect a Letter")]))

(define (count-by-letter dict lol)
  (cond
    [(empty? lol) '()]
    [(cons? lol) (cons (make-letter-count (first lol) (starts-with# (first lol) dict)) (count-by-letter dict (rest lol)))]))