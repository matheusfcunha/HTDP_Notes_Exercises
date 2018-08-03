;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_82) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 82. https://htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._struct11b%29%29

; Design the function compare-word. The function consumes two three-letter words (see exercise 78).
; It produces a word that indicates where the given ones agree and disagree.
; The function retains the content of the structure fields if the two agree;
; otherwise it places #false in the field of the resulting word.
; Hint The exercises mentions two tasks: the comparison of words and the comparison of “letters.”

; A 1String is one of: 
; - "a" to "z" (String)
; - #false     (Boolean)
; interpretation represents single lowercase string from alphabet or #false Boolean
; Examples:
(define 1String-ex1 "a")
(define 1String-ex2 "k")
(define 1String-ex3 "z")
(define 1String-ex4 #false)

(define-struct 3letter-word[l1 l2 l3])
; 3letter-word is a Structure:
; (make-3letter-word 1String 1String 1String)
; interpretation represents a word, composed by l1 l2 and l3.
; Examples:
(define 3letter-word-ex1 (make-3letter-word 1String-ex1 1String-ex2 1String-ex3)) ; a k z
(define 3letter-word-ex2 (make-3letter-word 1String-ex1 1String-ex3 1String-ex2)) ; a z k 
(define 3letter-word-ex3 (make-3letter-word 1String-ex1 1String-ex2 1String-ex4)) ; a k #false
(define 3letter-word-ex4 (make-3letter-word 1String-ex1 1String-ex4 1String-ex2)) ; a #false k
(define 3letter-word-ex5 (make-3letter-word 1String-ex4 1String-ex1 1String-ex2)) ; #false a k
(define 3letter-word-ex6 (make-3letter-word 1String-ex1 1String-ex2 1String-ex1)) ; a k a

; equality-result is a 3letter-word
; interpretation is:
; any 3letter-word field == String, means Agree (equal).
; any 3letter-word field == #false, means Disagree (not equal).
; Examples:
; (3letter-word-ex1)
; (3letter-word-ex3)

; 3letter-word 3letter-word ->  equality-result
; computes where the given w1 fields and matching w2 fields agree and disagree (equality), producing equality-result.
(check-expect (compare-word 3letter-word-ex1 3letter-word-ex1) 3letter-word-ex1)
(check-expect (compare-word 3letter-word-ex1 3letter-word-ex6) 3letter-word-ex3)
(check-expect (compare-word 3letter-word-ex1 (make-3letter-word "x" "y" "a")) (make-3letter-word #false #false #false))
(define (compare-word w1 w2)
  (make-3letter-word (letter-match? (3letter-word-l1 w1) (3letter-word-l1 w2))
                     (letter-match? (3letter-word-l2 w1) (3letter-word-l2 w2))
                     (letter-match? (3letter-word-l3 w1) (3letter-word-l3 w2)) )
  )

; 1String 1String -> 1String
; check for l1 l2 equality, if equal return l1, else return #false
(check-expect (letter-match? 1String-ex1 1String-ex1) 1String-ex1)
(check-expect (letter-match? 1String-ex1 1String-ex2) 1String-ex4)

(define (letter-match? l1 l2)
  (cond
    [(equal? l1 l2) l1]
    [else #false]))
