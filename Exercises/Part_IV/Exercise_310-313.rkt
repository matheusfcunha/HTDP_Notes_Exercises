;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Exercise_310-313) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp")) #f)))
; Exercise 310 ...link...

;-----------------------------------
; CONSTANTS
;-----------------------------------

;-----------------------------------
; DATA DEFINITIONS

; A [List-of ITEM] is one of: 
; – '() 
; – (cons ITEM [List-of ITEM])
; Interpretation: A list of given ITEM.

(define-struct no-parent [])
(define NP (make-no-parent))
(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of: 
; – NP
; – (make-child FT FT String N String)
;-----------------------------------

;-----------------------------------
; DATA DEFINITIONS EXAMPLES 

; FT (Family Tree):
; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))


;-----------------------------------

;-----------------------------------
; FUNCTIONS 

; Template for functions that deal with FT
; FT -> ???
;(define (fun-FT an-ftree)
;  (cond
;    [(no-parent? an-ftree) ...]
;    [else (... (fun-FT (child-father an-ftree)) ...
;           ... (fun-FT (child-mother an-ftree)) ...
;           ... (child-name an-ftree) ...
;           ... (child-date an-ftree) ...
;           ... (child-eyes an-ftree) ...)]))


; FT -> Boolean
; does an-ftree contain a child
; structure with "blue" in the eyes field
(check-expect (blue-eyed-child? Carl) #false)
(check-expect (blue-eyed-child? Gustav) #true)
(define (blue-eyed-child? an-ftree)
  (cond
    [(no-parent? an-ftree) #false] 
    [else (or (string=? (child-eyes an-ftree) "blue")
              (blue-eyed-child? (child-father an-ftree))
              (blue-eyed-child? (child-mother an-ftree)))]))

; FT -> Number
; Consumes a family tree and counts the child structures in the tree.
(check-expect (count-persons Carl)  1)
(check-expect (count-persons Adam)  3)
(check-expect (count-persons Gustav) 5)
(define (count-persons an-ftree)
  (cond
    [(no-parent? an-ftree) 0] 
    [else (+ (count-persons (child-father an-ftree))
             (count-persons (child-mother an-ftree))
             1
           )]))

; FT Number -> Number
; consumes a family tree and the current year. It produces the average age of all child structures in the family tree.
(check-expect (average-age NP 2018) 0)
(check-expect (average-age Carl 2018) 92)
(check-expect (average-age Adam 2018) 84)
(check-expect (average-age Eva 2018) 79)
(check-expect (average-age Fred 2018) 52)
(define (average-age an-ftree current-year)
    (cond
    [(no-parent? an-ftree) 0]
    [else (/ (+ (average-age (child-father an-ftree) current-year) 
                (average-age (child-mother an-ftree) current-year) 
                (- current-year (child-date an-ftree))) 
             (count-persons an-ftree))]))

; FT -> [List-of String]
; consumes a family tree and produces a list of all eye colors in the tree
(check-expect (eye-colors NP) '())
(check-expect (eye-colors Carl) '("green"))
(check-expect (eye-colors Adam) '("hazel" "green" "green"))
(check-expect (eye-colors Gustav) '("brown" "pink" "blue" "green" "green"))
(define (eye-colors an-ftree)
  (match an-ftree
    [(no-parent) '()]
    [ (child father mother name birthdate eyecolor) (cons eyecolor (append (eye-colors father) (eye-colors mother))) ]))

; FT -> Boolean
; Given a family tree check if any ancestors has blue eyes.
(check-expect (blue-eyed-ancestor? Eva) #false)
(check-expect (blue-eyed-ancestor? Gustav) #true)
(define (blue-eyed-ancestor? an-ftree)
  (match an-ftree
    [(no-parent) #false]
    [(child father mother name birthdate eyecolor)
     (or
       (or
         (and (child? father) (equal? (child-eyes father) "blue"))
         (and (child? mother) (equal? (child-eyes mother) "blue")))
       (blue-eyed-ancestor? father)
       (blue-eyed-ancestor? mother))]))




;---------------------------------------------------------------
; Template for functions that deal with FT
; FT -> ???
;(define (ft-reduce f basecase an-ftree)
 ; (cond
 ;   [(no-parent? an-ftree) basecase]
 ;   [else (f   (ft-reduce f basecase (child-father an-ftree))
 ;              (ft-reduce f basecase (child-mother an-ftree))
 ;          )]))

; FT -> Number
;(check-expect (count-persons.v2 Carl) 1)
;(check-expect (count-persons.v2 Gustav) 5)
;(define (count-persons.v2 an-ftree)
;  (ft-reduce (lambda (x y) (+ x y 1)) 0 an-ftree)
;  )

;(define (blue-eyed-child.v2 an-ftree)
;  (ft-reduce (lambda (x y) (or x y (string=? (child-eyes an-ftree) "blue")z)) #false an-ftree) 
;)
;-----------------------------------
