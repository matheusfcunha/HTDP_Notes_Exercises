;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |9.6 A Note on Lists and Sets-exercise|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; a List-of-string is one of:
; - '()
; - (cons String List-of-string)

; List-of-string String -> N
; determines how often s occurs in los
(check-expect (count '() "john") 0)
(check-expect (count (cons "amir" '()) "john") 0)
(check-expect (count (cons "john" '()) "john") 1)
(check-expect (count (cons "amir" (cons "sapir" '())) "john") 0)
(check-expect (count (cons "amir" (cons "john" '())) "john") 1)
(check-expect (count (cons "amir" (cons "sapir" (cons "zafir" '()))) "john") 0)
(check-expect (count (cons "amir" (cons "john" (cons "zafir" '()))) "john") 1)
(check-expect (count (cons "amir" (cons "john" (cons "zafir" (cons "john" '())))) "john") 2)
(define (count los s)
  (cond
    [(empty? los) 0]
    [(cons? los) (if (equal? (first los) s) (+ 1 (count (rest los) s)) (+ 0 (count (rest los) s)))]
    ))