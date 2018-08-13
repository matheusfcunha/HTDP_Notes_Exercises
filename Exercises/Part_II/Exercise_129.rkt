;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_129) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 129 https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._ex~3alist1%29%29

(define celestial-bodies (cons "Earth" (cons "Venus" (cons "Mercury" '()))))

(define meal-items (cons "ice cream"
                         (cons "brie cheese"
                               (cons "water"
                                     (cons "bread"
                                           (cons "beans"
                                                 (cons "french-fries"
                                                       (cons "steak" '()
                                                             )))))))) 

