;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname Exercise_250) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 250 https://htdp.org/2018-01-06/Book/part_three.html#%28counter._%28exercise._ex~3aabs-tabulate%29%29


; Number -> [List-of Number]
; tabulates sin between n 
; and 0 (incl.) in a list
;(check-expect (tab-sin 3) (list #i0.1411200080598672 #i0.9092974268256817 #i0.8414709848078965 0))
(define (tab-sin n)
  (cond
    [(= n 0) (list (sin 0))]
    [else
     (cons
      (sin n) ;;;;;
      (tab-sin (sub1 n)))]))
   

; Number -> [List-of Number]
; tabulates sqrt between n 
; and 0 (incl.) in a list
;(check-expect (tab-sqrt 3) (list #i1.7320508075688772 #i1.4142135623730951 1 0))
(define (tab-sqrt n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (sqrt n) ;;;;;
      (tab-sqrt (sub1 n)))]))

; -------------------------------- ABSTRACTION ----------------------------

;(check-expect (tabulate sin 3) (list #i0.1411200080598672 #i0.9092974268256817 #i0.8414709848078965 0))
;(check-expect (tabulate sqrt 3) (list #i1.7320508075688772 #i1.4142135623730951 1 0))
(define (tabulate fn n)
  (cond
    [(= n 0) (list (sqrt 0))]
    [else
     (cons
      (fn n) 
      (tabulate fn (sub1 n)))]))