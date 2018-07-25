;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_17) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 17.  http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._fun10%29%29

(define (image-classify img)
  (if (> (image-height img) (image-width img))
    "tall"
    (if (= (image-height img) (image-width img))
        "square"
        "wide")))

(define TALL   (rectangle 10 20 "solid" "blue"))
(define WIDE   (rectangle 20 10 "solid" "blue"))
(define SQUARE (rectangle 20 20 "solid" "blue"))

(image-classify TALL)
(image-classify WIDE)
(image-classify SQUARE)