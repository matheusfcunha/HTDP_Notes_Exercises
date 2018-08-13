;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_134) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 134. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._contains-flatt03%29%29

(define list-ex1 (cons "Fagan"
  (cons "Findler"
    (cons "Fisler"
      (cons "Flanagan"
        (cons "Flatt"
          (cons "Felleisen"
            (cons "Friedman" '()))))))))

(define list-ex2 (cons "X" (cons "Y"  (cons "Z" '()))))


; String List-of-names -> Boolean
; Determine wheter 'alon' contains 's' in it.
(check-expect (contains-string? "Y" list-ex2) #true)
(check-expect (contains-string? "A" list-ex2) #false)
(check-expect (contains-string? "Felleisen" list-ex1) #true)
(check-expect (contains-string? "John" list-ex1) #false)

(define (contains-string? s alon)
  (cond
   [(empty? alon) #false]
   [(cons? alon) (cond
                   [(string=? s (first alon)) #true]
                   [else (contains-string? s (rest alon))])]
   )
  )

