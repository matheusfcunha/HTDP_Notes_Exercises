;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_195) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 195. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._ex~3adictionary1%29%29
(define LOCATION "words")

; A List-of-strings is one of:
; - '()
; - (cons String List-of-strings)

; A Dictionary is a List-of-strings.
(define AS-LIST (read-lines LOCATION))
; Examples:
(define d1 '())
(define d2 (list "apple"))
(define d3 (list "apple" "banana"))
(define d4 (list "apple" "banana" "z-word"))
(define d5 (list "apple" "banana" "avocado"))


; A Letter is one of the following 1Strings: 
; – "a"
; – ... 
; – "z"
; or, equivalently, a member? of this list: 
(define LETTERS
  (explode "abcdefghijklmnopqrstuvwxyz"))
; Examples:
(define l1 "a")
(define l2 "b")
(define l3 "m")
(define l4"z")

;---------------------------------------------------------

; Letter Dictionary -> Number
; counts how many words in the given 'dict' start with the given 'letter'.
(check-expect (starts-with# l1 d1) 0) ; 'a' '()
(check-expect (starts-with# l3 d4) 0) ; 'm' (list "apple" "banana" "cucumber")
(check-expect (starts-with# l1 d2) 1) ; 'a' (list "apple")
(check-expect (starts-with# l1 d3) 1) ; 'a' (list "apple" "banana")
(check-expect (starts-with# l2 d4) 1) ; 'b' (list "apple" "banana" "z-word")
(check-expect (starts-with# l1 d5) 2) ; 'a' (list "apple" "banana" "avocado")
(check-error (starts-with# "string" d5) "starts-with#: Expect a Letter") ; 'string' (list "apple" "banana" "avocado")

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

; (starts-with# l1 d5)
; (first dict)                      = String       'apple'
; (rest dict)                       = Dictionary     (list 'banana' 'avocado')
; (starts-with# letter (rest dict)) = counts how many words in the given 'dict' start with the given 'letter'   1
                                           ; Expected answer: 2

