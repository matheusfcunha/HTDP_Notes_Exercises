;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_20) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 20. http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._fun10c%29%29

(define (string-delete str x)
  (if (> (string-length str) 0)
      (string-append (substring str 0 x) (substring str (+ x 1) (string-length str)))
      (string-append str)
      )
  )


(string-delete "John" 2)