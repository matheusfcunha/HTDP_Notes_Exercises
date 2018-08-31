;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_173) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 173. https://htdp.org/2018-01-06/Book/part_two.html#%28counter._%28exercise._no-articles%29%29


; Article is one of:
; - "a"
; - "an"
; - "the"
; iterpretation an article from English language.

; File is a String
; interpretation is, name of a file on the computer, on the same directory as DrRacket.

; An List-of-words
; is one of: 
; – '() 
; – (cons Word List-of-words) 
; Word is a String, Without the " " character
; Interpretation is a list of words
; Ex:
(define low-ex1 (cons "Text" (cons "Title" '())))
(define low-ex2 (cons "Sub" (cons "Title" '())))
(define low-ex3 (cons "Body" (cons "text" (cons "content!" '()))))
(define low-ex4 (cons "a" (cons "an" (cons "the" '()))))
(define low-ex5 (cons "hello" (cons "an" (cons "world" '()))))
(define low-ex5-article-removed (cons "hello" (cons "" (cons "world" '()))))

; An List-of-lines is one of: 
; – '()
; – (cons List-of-words List-of-lines)
; interpretation a list of lines, each is a List-of-words.
;(define lol-ex1 (cons (cons "Title" '()) (cons '() (cons (cons "Put" (cons "up" (cons "in" (cons "string" (cons "place" '()))))) '()))))
;(define lol-ex2 (cons (cons "Title" '()) (cons '() (cons (cons "Put" (cons "up" (cons "in" (cons "a" (cons "place" '()))))) '()))))
(define lol-ex3 (cons (cons "the" '()) (cons '() (cons (cons "the" (cons "up" (cons "in" (cons "an" (cons "place" '()))))) '()))))
(define lol-ex5 (cons low-ex1 (cons low-ex2 (cons low-ex3 '()))))
(define lol-ex6 (cons low-ex1 (cons low-ex5 (cons low-ex3 '()))))
(define lol-ex6-article-removed (cons low-ex1 (cons low-ex5-article-removed (cons low-ex3 '()))))

; File -> File
; consumes a File, read's the content, remove it's Articles, if any, and
; produce a new File
 (check-expect (remove-articles "ttt.txt") "no-articles-ttt.txt")
 (define (remove-articles f)
  (write-file (string-append "no-articles-" f) (collapse (check-n-remove (read-words/line f)))))

; List-of-lines -> List-of-lines
; Consumes a list of lines, and produces a new one, with items from 'Article' removed, if any.
(check-expect (check-n-remove '()) '())
(check-expect (check-n-remove lol-ex5) lol-ex5)
(check-expect (check-n-remove lol-ex6) lol-ex6-article-removed)
;(check-expect (check-n-remove lol-ex3) (cons (cons '() (cons (cons "up" (cons "in" (cons "place" '()))) '())) '()))
(define (check-n-remove file-lines)
  (cond
    [(empty? file-lines) '()]
    [(cons? file-lines)  (cons (remove-words (first file-lines)) (check-n-remove (rest file-lines)))]
    ))

; List-of-lines -> String
; converts a list of lines into a string.
; Word(s) separated by blank spaces (" "). The lines separated with a newline ("\n").
(check-expect (collapse '()) "")
(check-expect (collapse lol-ex5) "Text Title\nSub Title\nBody text content!\n")
(define (collapse file-lines)
  (cond
    [(empty? file-lines) ""]
    [(cons? file-lines)  (string-append (make-line-str (first file-lines)) "\n" (collapse (rest file-lines)))]
    ))
                                     ; (first file-lines) Extracts a single line (a List-of-words)                      (rest file-lines) extracts a list of lines
                                     ; (listofwords-template (first file-lines)) process the (first file-lines) data    (collapse (rest file-lines)) converts the list into a string


; List-of-words -> String
; make a string from a list of word
(check-expect (make-line-str '()) "")
(check-expect (make-line-str low-ex1) "Text Title")
(check-expect (make-line-str low-ex3) "Body text content!")
(define (make-line-str file-words)
  (cond
    [(empty? file-words) ""]
    [(empty? (rest file-words)) (first file-words)]
    [(cons? file-words)  (string-append (first file-words) " " (make-line-str (rest file-words)))]
    ))


; List-of-words -> List-of-words
; make a string from a list of word
;(check-expect (remove-words '()) '())
;(check-expect (remove-words low-ex3) low-ex3)
;(check-expect (remove-words low-ex4) '())
;(check-expect (remove-words low-ex5) (cons "hello" (cons "world" '())))
(define (remove-words file-words)
  (cond
    [(empty? file-words) '()]
    [(cons? file-words)  (cond [(not (or
                                    (equal? (first file-words) "a")
                                    (equal? (first file-words) "an")
                                    (equal? (first file-words) "the")))
                                      (cons (first file-words) (remove-words (rest file-words)))]
                                     [else (cons "" (remove-words (rest file-words)))])]))