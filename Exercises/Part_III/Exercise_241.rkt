;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_241) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 241. https://htdp.org/2018-01-06/Book/part_three.html#%28counter._sim-dd._%28exercise._ex~3anelist-of%29%29

; An NEList-of-temperatures is one of: 
; – (cons CTemperature '())
; – (cons CTemperature NEList-of-temperatures)
; interpretation non-empty lists of Celsius temperatures 

; An NEList-of-Booleans is one of: 
; – (cons Boolean '())
; – (cons Boolean NEList-of-Booleans)
; interpretation non-empty lists of Booleans


; -------------------------------------- ABSTRACT --------------------------------------


; An [NEList-of ITEM] is one of: 
; – (cons ITEM '())
; – (cons ITEM [NEList-of ITEM])
; interpretation non-empty lists of ITEM

