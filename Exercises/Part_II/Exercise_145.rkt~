;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_145) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 145 https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._nelist4%29%29


; A CTemperature is a Number greater than -273.
(define CTemperature-ex1 -272)
(define CTemperature-ex2 0)
(define CTemperature-ex3 40)

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 
(define NElot-ex1 (cons CTemperature-ex1 '()))
(define NElot-ex2 (cons CTemperature-ex1 (cons CTemperature-ex2 '())))
(define NElot-ex3 (cons CTemperature-ex1 (cons CTemperature-ex2 (cons CTemperature-ex3 '()))))
(define NElot-ex4 (cons CTemperature-ex3 (cons CTemperature-ex2 (cons CTemperature-ex1 '()))))

                        
; NEList-of-temperatures -> Boolean
; Computes if the temperatures are sorted in descending order.
(check-expect (sorted>? NElot-ex1) #true)
(check-expect (sorted>? NElot-ex2) #false)
(check-expect (sorted>? NElot-ex3) #false)
(check-expect (sorted>? NElot-ex4) #true) 
(define (sorted>? nelot)
  (cond
    [(empty? (rest nelot)) #true]
    [(cons? nelot) (and (> (first nelot) (first (rest nelot))) (sorted>? (rest nelot)))]
    ))
                       
                       