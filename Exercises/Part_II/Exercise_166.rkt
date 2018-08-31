;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_166) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 166. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._work1%29%29

(define-struct employee [name number])
; Employee is a structure
; (make-employee String Number)
; interpretation (make-employee name num) is the employee information's,
; it's name and registry number
; Ex:
(define employee-ex1 (make-employee "John" 325))
(define employee-ex2 (make-employee "Smith" 326))
(define employee-ex3 (make-employee "Annie" 327))

(define-struct work [employee rate hours])
; A (piece of) Work is a structure: 
;   (make-work String Employee Number)
; interpretation (make-work e r h) combines the employee's information, 
; with the pay rate r and the number of hours h
; Ex:
(define work-ex1 (make-work employee-ex1 5 10))
(define work-ex2 (make-work employee-ex2 8.5 12))
(define work-ex3 (make-work employee-ex3 6.3 20))

; Low (short for list of works) is one of: 
; – '()
; – (cons Work Low)
; interpretation an instance of Low represents the 
; hours worked for a number of employees
(define low-ex1 '())
(define low-ex2 (cons work-ex1 '()))
(define low-ex3 (cons work-ex1 (cons work-ex2 '())))
(define low-ex4 (cons work-ex1 (cons work-ex2 (cons work-ex3 '()))))

(define-struct paycheck [employee pay-amount])
; Paycheck is a structure:
; (make-paycheck Employee Number)
; interpretation (make-paycheck n a)
; n: the employee information.
; a: the amount of money it goes on the paycheck of the employee.
(define paycheck-ex1 (make-paycheck (work-employee work-ex1) (* (work-rate work-ex1) (work-hours work-ex1)) ))
(define paycheck-ex2 (make-paycheck (work-employee work-ex2) (* (work-rate work-ex2) (work-hours work-ex2)) ))
(define paycheck-ex3 (make-paycheck (work-employee work-ex3) (* (work-rate work-ex3) (work-hours work-ex3)) ))

; Lop (short for list of paychecks) is one of:
; - '()
; - (cons Paycheck Lop)
; interpretation an instance of Lop represents employee's paycheck's.
(define lop-ex1 '())
(define lop-ex2 (cons paycheck-ex1 '()))
(define lop-ex3 (cons paycheck-ex1 (cons paycheck-ex2 '())))
(define lop-ex4 (cons paycheck-ex1 (cons paycheck-ex2 (cons paycheck-ex3 '()))))

; Low -> Lop
; It consumes a list of work records and computes a list of paychecks from it, one per record.
(check-expect (wage*.v3 low-ex1) '())
(check-expect (wage*.v3 low-ex2) (cons paycheck-ex1 '()))
(check-expect (wage*.v3 low-ex3) (cons paycheck-ex1 (cons paycheck-ex2 '())))
(check-expect (wage*.v3 low-ex4) (cons paycheck-ex1 (cons paycheck-ex2 (cons paycheck-ex3 '()))))
(check-error  (wage*.v3 "string") "wage*.v3 expect a List-of-work")
           
(define (wage*.v3 low) 
  (cond
    [(empty? low) '()]
    [(cons? low)  (cons (create-paycheck (first low)) (wage*.v3 (rest low)))]  ; DESIGN RECIPE STEP 5 ANSWERS
                                                                               ; (first low) extract a single Work Structure it cointains the employee name, the pay rate, and the number of hours worked
    [else (error "wage*.v3 expect a List-of-work")]                            ; (rest low) extract a list of Works (Low)
    ))                                                                         ; NATURAL RECURSION - (wage*.v3 (rest low)) consumes a Low  and computes a list of paychecks from it, one per record.
                                                                               ; (create-paycheck (first low)) is a template for the Work structure (cross-reference).

; Work -> Paycheck
; Computes the Paycheck based on the given Work
(check-expect (create-paycheck work-ex1) (make-paycheck (work-employee work-ex1) (* (work-rate work-ex1) (work-hours work-ex1))))
(define (create-paycheck w)
  (make-paycheck (work-employee w) (* (work-rate w) (work-hours w))))


; Low -> Lop
; It consumes a list of work records and computes a list of paychecks from it, one per record.
(check-expect (wage*.v4 low-ex1) '())
(check-expect (wage*.v4 low-ex2) (cons paycheck-ex1 '()))
(check-expect (wage*.v4 low-ex3) (cons paycheck-ex1 (cons paycheck-ex2 '())))
(check-expect (wage*.v4 low-ex4) (cons paycheck-ex1 (cons paycheck-ex2 (cons paycheck-ex3 '()))))
(define (wage*.v4 low) 
  (cond
    [(empty? low) '()]
    [(cons? low) (cons (create-paycheck (first low)) (wage*.v4 (rest low)))]
    [else (error "wage*.v4 expect a List-of-work")]  
    ))

;; The wage*.v3 to wage*.v4 function body difference is none in this way of defining the data.
;; But if we might need to work with employee structure fields, consider having a different (create-paycheck) function, plus another template/function for Employee why?
;; Because the body of (create-paycheck) have to deal with a cross-reference to another data definition beyond 'Work', ( Employee )

; Work -> Paycheck
; Computes the Paycheck based on the given Work
; (define (create-paycheck w)
;  (make-paycheck (template-for-employee (work-employee w)) (* (work-rate w) (work-hours w))))

; Employee -> ???
; Template for Employee
;(define (template-for-employee e)
;  ...(employee-name e)...
;  ...(employee-number e)...)
