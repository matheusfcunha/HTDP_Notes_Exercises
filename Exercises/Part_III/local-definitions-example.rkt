;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname local-definitions-example) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; [List-of Addr] -> String 
; creates a string of first names, 
; sorted in alphabetical order,
; separated and surrounded by blank spaces
(define (listing.v2 l)
  (local 
      (   ; 1. extract names 
          (define names  (map address-first-name l))
          
          ; 2. sort the names 
          (define sorted (sort names string<?))

          (define concat+spaces
            (local
              (  ; String String -> String
                   (define (helper s t)
                      (string-append " " s t)))
              (foldr helper " " sorted)
              ))
       )
      concat+spaces
   )
)


; Nelon -> Number
; determines the smallest number on l
(define (inf.v2 l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (local ((define smallest-in-rest (inf.v2 (rest l))))
       (if (< (first l) smallest-in-rest)
           (first l)
           smallest-in-rest))]))