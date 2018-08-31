;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_142) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 142. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._ex~3alist-image%29%29

; listOfImage is one of:
; - '()
; - (cons Image listOfImage)
; interpretation: a list of images.
; Examples:
(define loi-ex1 '())
(define loi-ex2 (cons (rectangle 10 10 "solid" "blue") '()))
(define loi-ex3 (cons (rectangle 10 10 "solid" "blue") (cons (rectangle 10 10 "solid" "blue") '())))
(define loi-ex4 (cons (rectangle 20 20 "solid" "blue") '()))
(define loi-ex5 (cons (rectangle 20 20 "solid" "blue") (cons (rectangle 10 10 "solid" "blue") '())))
(define loi-ex6 (cons (rectangle 10 10 "solid" "blue") (cons (rectangle 10 10 "solid" "blue") (cons (rectangle 20 20 "solid" "blue") '()))))


; ImageOrFalse is one of:
; – Image
; – #false
; interpretation: image which is not a n by n square.

; listOfImage PositiveNumber -> ImageOrFalse
; returns the first image on loi that is not an n by n square.
(check-expect (ill-sized? loi-ex1 10) #false)
(check-expect (ill-sized? loi-ex2 10) #false)
(check-expect (ill-sized? loi-ex3 10) #false)
(check-expect (ill-sized? loi-ex4 10) (rectangle 20 20 "solid" "blue"))
(check-expect (ill-sized? loi-ex5 10) (rectangle 20 20 "solid" "blue"))
(check-expect (ill-sized? loi-ex6 10) (rectangle 20 20 "solid" "blue"))
(define (ill-sized? loi n)
  (cond
    [(empty? loi) #false]
    [(cons? loi) (if (and (equal? n (image-width (first loi))) (equal? n (image-height (first loi)))) (ill-sized? (rest loi) n)  (first loi))]
    ))
