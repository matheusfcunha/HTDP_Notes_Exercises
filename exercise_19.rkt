;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_19) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 19. http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._fun10b%29%29

(define (string-insert str x)
  (string-append (substring str 0 x) "_" (substring str x (string-length str)))
  )


(string-insert "John" 2)