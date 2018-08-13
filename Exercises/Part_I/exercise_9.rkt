;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_9) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 9 http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._arith-p2%29%29



(define in -5)

(cond
  [(string? in) (string-length in)]
  [(image? in) (* (image-width in) (image-height in))]
  [(number? in) (cond
                  [(<= in 0) in]
                  [(> in 0) (- in 1)]
                  )]
  [(boolean? in) (cond
                   [(boolean=? in true) 10]
                   [(boolean=? in false) 20])]
  )