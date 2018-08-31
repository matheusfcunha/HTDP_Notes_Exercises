;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_170) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 170 https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._work4%29%29

(define OLD-AREA-CODE 713)
(define NEW-AREA-CODE 281)

(define-struct phone [area switch four])
;  Phone is a structure: 
;   (make-phone Three Three Four)
; A Three is a Number between 100 and 999. 
; A Four is a Number between 1000 and 9999.
; Ex:
(define phone-ex1 (make-phone 100 100 1000))
(define phone-ex2 (make-phone 500 500 5000))
(define phone-ex3 (make-phone 999 999 9999))
(define phone-ex4 (make-phone 713 259 9148))
(define phone-ex5 (make-phone 259 713 9148))
(define phone-ex6 (make-phone 713 713 9148))

; A List-of-Phones is one of:
; - '()
; - (cons Phone List-of-Phones)
; Ex:
(define lop-ex1 '())
(define lop-ex2 (cons phone-ex1'()))
(define lop-ex3 (cons phone-ex1 (cons phone-ex2 '())))
(define lop-ex4 (cons phone-ex1 (cons phone-ex2 (cons phone-ex3 '()))))
; Examples with OLD-AREA-CODE area code
(define lop-ex5 (cons phone-ex4 '()))
(define lop-ex6 (cons phone-ex6 '()))
(define lop-ex7 (cons phone-ex4 (cons phone-ex5 '())))
(define lop-ex8 (cons phone-ex4 (cons phone-ex5 (cons phone-ex6 '()))))

; List-of-Phones -> List-of-Phones
; It replaces all occurrence of area code OLD-AREA-CODE from list-of-phones, with NEW-AREA-CODE
(check-expect (replace lop-ex1) '())
(check-expect (replace lop-ex2) lop-ex2)
(check-expect (replace lop-ex3) lop-ex3)
(check-expect (replace lop-ex4) lop-ex4)
(check-expect (replace lop-ex5) (cons (make-phone 281 259 9148) '()))
(check-expect (replace lop-ex6) (cons (make-phone 281 713 9148) '()))
(check-expect (replace lop-ex7) (cons (make-phone 281 259 9148) (cons (make-phone 259 713 9148) '())))
(check-expect (replace lop-ex8) (cons (make-phone 281 259 9148) (cons (make-phone 259 713 9148) (cons (make-phone 281 713 9148) '()))))
(check-error (replace 713) "error: replace expects List-of-phones")
(define (replace list-of-phones)
  (cond
    [(empty? list-of-phones) '()]
    [(cons? list-of-phones)  (cons (change-area (first list-of-phones)) (replace (rest list-of-phones)))]
    [else (error "error: replace expects List-of-phones")]
    ))

; Phone -> Phone
; Check if p has OLD-AREA-CODE on area field and replace for NEW-AREA-CODE
(define (change-area p)
  (make-phone (if (equal? (phone-area p) OLD-AREA-CODE) NEW-AREA-CODE (phone-area p)) (phone-switch p) (phone-four p)))
