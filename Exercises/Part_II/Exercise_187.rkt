;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Exercise_187) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 187. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._ex~3asort1-b%29%29

(define-struct gp [name score])
; A GamePlayer is a structure:
;    (make-gp String Number)
; interpretation (make-gp p s) represents player p who
; scored a maximum of s points
(define gp-ex1  (make-gp "Joe" 500))
(define gp-ex2  (make-gp "Phill" 450))
(define gp-ex3  (make-gp "Yander" 220))
(define gp-ex4  (make-gp "Annie" 90))
 
; list-of-gameplayers is one of:
; - '( )
; - (list GamePlayer list-of-gameplayer)
; interpretation: list of GamePlayer    Structure
(define logp-ex1 '())
(define logp-ex2 (list gp-ex1))
(define logp-ex3 (list gp-ex1 gp-ex2 gp-ex3 gp-ex4))
(define logp-ex4 (list gp-ex4 gp-ex3 gp-ex2 gp-ex1))
(define logp-ex5 (list gp-ex4 gp-ex1 gp-ex3 gp-ex2))
 
; Logp -> Logp
; sorts lists of game players by score, in descending order
(check-expect (sort-logp logp-ex1)'() )
(check-expect (sort-logp logp-ex2) logp-ex2)
(check-expect (sort-logp logp-ex3) logp-ex3)
(check-expect (sort-logp logp-ex4) logp-ex3)
(check-expect (sort-logp logp-ex5) logp-ex3)
(define (sort-logp l)
   (cond
      [(empty? l) '()]
      [(cons? l)    (insert (first l) (sort-logp (rest l)))])) 

                                                            ; (first l) =  (make-gp "Annie" 90)
                                                            ; (rest l)  =  (list (make-gp "Joe" 500) (make-gp "Yander" 220) (make-gp "Phill" 450) )
                                                            ; (sort-logp (rest l)) = (list  (make-gp "Joe" 500) (make-gp "Phill" 450) make-gp "Yander" 220))

; GamePlayer Logp -> Logp
; insert gp in logp, at it's correct position.
(check-expect (insert (make-gp "Annie" 90)  '()) (list (make-gp "Annie" 90)))
(check-expect (insert (make-gp "Annie" 90) (list  (make-gp "Joe" 500) (make-gp "Phill" 450) (make-gp "Yander" 220))) logp-ex3)
(define (insert gp logp)
  (cond
    [(empty? logp) (list gp)]                                       
    [(cons? logp)     (if (>= (gp-score gp) (gp-score (first logp)))
                          (cons gp logp)
                          (cons (first logp) (insert gp (rest logp))))]))

                                                              ; (first logp) = (make-gp "Joe" 500)
                                                              ; (rest logp) = (list (make-gp "Phill" 450) (make-gp "Yander" 220))
                                                              ; (insert gp (rest logp)) = (list (make-gp "Phill" 450) (make-gp "Yander" 220) (make-gp "Annie" 90) )