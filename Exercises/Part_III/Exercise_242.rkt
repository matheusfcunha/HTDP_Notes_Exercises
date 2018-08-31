;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_242) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 242. https://htdp.org/2018-01-06/Book/part_three.html#%28counter._sim-dd._%28exercise._ex~3amaybe%29%29

; A [List-of ITEM] is one of: 
; – '() 
; – (cons ITEM [List-of ITEM])


; Here is one more parametric data definition:

; A [Maybe X] is one of: 
; – #false 
; – X

; [Maybe String]:
; A [Maybe String] is one of: 
; – #false 
; – String

; [Maybe [List-of String]]:
; A [Maybe List-of String] is one of: 
; – #false 
; – List-of String

; [List-of [Maybe String]]:
; A [List-of [Maybe String]] is one of: 
; – '() 
; – (cons [Maybe String] [List-of [Maybe String]])




; What does the following function signature mean:

; String [List-of String] -> [Maybe [List-of String]]
; returns the remainder of los starting with s 
; #false otherwise 
(check-expect (occurs "a" (list "b" "a" "d" "e"))
              (list "d" "e"))
(check-expect (occurs "a" (list "b" "c" "d")) #f)
(define (occurs s los)
  (cond
    [(empty? los) #f]
    [(cons? los)  (if (equal? (first los) s) (rest los) (occurs s (rest los)))]))


;(first los)  -> String
;(rest los)   -> [List-of String]
;(occurs s (rest los)) -> [Maybe [List-of String]]

;(occurs "a" (list "b" "a" "d" "e"))
;(first los)  -> "b"
;(rest los)   -> (list "a" "d" "e")
;(occurs "a" (list "a" "d" "e")) -> (list "d" "e")   [Maybe [List-of String]]

;(occurs "a" (list "b" "c" "d"))
;(first los)  -> "b"
;(rest los)   -> (list "c" "d")
;(occurs "a" (list "c" "d")) -> #false   [Maybe [List-of String]]
