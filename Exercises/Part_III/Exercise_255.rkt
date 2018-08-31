;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_255) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 255 https://htdp.org/2018-01-06/Book/part_three.html#%28counter._%28exercise._ex~3afancy-signatures2%29%29

; map-n
; [List-of Numbers] (Numbers -> Numbers) -> [List-of Numbers]

            ...       ...        ...                 ...
; map-s 
; [List-of Strings] (String -> String)  -> [List-of String]

; [X] [List-of X] (X -> X) -> [List-of X]



; [List-of Numbers] [Number -> Number] -> [List-of Numbers]
            ...       ...    ...                   ...
; [List-of IR]       [IR -> String] ->   [List-of Strings]

; map1
; [X Y] [List-of X] (X -> Y) -> [List-of X]