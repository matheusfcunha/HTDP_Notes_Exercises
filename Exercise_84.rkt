;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_84) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 84 https://htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._struct-edit1%29%29

 
(define EMPTSCN-WIDTH 200)
(define EMPTSCN-HEIGHT 20)
(define EMPTSCN (empty-scene EMPTSCN-WIDTH EMPTSCN-HEIGHT)) ; Place where the text is going to be rendered.
(define TEXT-SIZE 11)
(define TEXT-COLOR "black")
(define CURSOR (rectangle 1 20 "solid" "red"))

; editor -> editor 
; Launch the interactive editor with given editor pre and post fields.
(define (run editor)
  (big-bang editor
    [to-draw render]
    [on-key edit]))

(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t
; Example: 
(define editor-ex1 (make-editor "hello " "world"))           
(define editor-ex2 (make-editor "hey" " world"))
(define editor-ex3 (make-editor "hello again" " world"))
(define editor-ex4 (make-editor "hello" ""))
(define editor-ex5 (make-editor "" "hello"))
(define editor-ex6 (make-editor "he" "llo"))
(define editor-ex7 (make-editor "hello world" ""))
(define editor-ex8 (make-editor "hello" "world")) "hellozworld"

; Editor -> Image           |  struct -> image
; Render the cursor between editor pre and post fields, on top of EMPTSCN.
 (check-expect (render editor-ex1) (overlay/align "left" "center" (beside (text (editor-pre editor-ex1) TEXT-SIZE TEXT-COLOR) CURSOR (text (editor-post editor-ex1) TEXT-SIZE TEXT-COLOR)) EMPTSCN))
 (check-expect (render editor-ex2) (overlay/align "left" "center" (beside (text (editor-pre editor-ex2) TEXT-SIZE TEXT-COLOR) CURSOR (text (editor-post editor-ex2) TEXT-SIZE TEXT-COLOR)) EMPTSCN))
 (check-expect (render editor-ex3) (overlay/align "left" "center" (beside (text (editor-pre editor-ex3) TEXT-SIZE TEXT-COLOR) CURSOR (text (editor-post editor-ex3) TEXT-SIZE TEXT-COLOR)) EMPTSCN))
(define (render editor)
  (overlay/align "left" "center"
                 (beside 
                         (text (editor-pre editor) TEXT-SIZE TEXT-COLOR)   ; Left of the cursor
                         CURSOR                                            ; Cursor
                         (text (editor-post editor) TEXT-SIZE TEXT-COLOR)) ; Right of the cursor
                 EMPTSCN))


; A KeyEvent is http://docs.racket-lang.org/teachpack/2htdpuniverse.html#%28tech._world._keyevent%29

; editor KeyEvent -> editor         |  struct string -> struct
; add's a single-character KeyEvent ke to the end of the pre field of ed (editor-pre ed), or if
; ke is backspace ("\b") key, deletes the last character of pre field (if there is one);
; ke is "left" or "right" keys, moves the cursor.
; Ignore all other ke.
(check-expect (edit editor-ex1 "a") (make-editor "hello a" "world")) ; [hello a] [world] 
(check-expect (edit editor-ex1 "h") (make-editor "hello h" "world")) ; [hello h] [world]
(check-expect (edit editor-ex2 "z") (make-editor "heyz" " world")) ; [heyz] [world]
(check-expect (edit editor-ex7 "a") (make-editor "hello worlda" "")) ; [hello worlda] []
(check-expect (edit editor-ex5 "h") (make-editor "h" "hello")) ; [h] [hello] 
(check-expect (edit editor-ex8 "z") (make-editor "helloz" "world")) ; [helloz] [world]
(check-expect (edit editor-ex6 " ") (make-editor "he " "llo")) ; [he ] [llo]
(check-expect (edit editor-ex1 "\b") (make-editor "hello" "world")); [hello] [world]
(check-expect (edit editor-ex7 "\b") (make-editor "hello worl" "")); [hello worl] []
(check-expect (edit editor-ex5 "\b") (make-editor "" "hello")); [] [hello]
(check-expect (edit editor-ex6 "\b") (make-editor "h" "llo")); [h] [llo]
(check-expect (edit editor-ex2 "left") (make-editor "he" "y world"))  ; [he] [y world]
(check-expect (edit editor-ex1 "left") (make-editor "hello" " world"))  ; [hello] [ world]
(check-expect (edit editor-ex7 "left") (make-editor "hello worl" "d"))  ; [hello worl] [d]
(check-expect (edit editor-ex5 "left") (make-editor "" "hello"))  ; [] [hello] 
(check-expect (edit editor-ex2 "right") (make-editor "hey " "world")) ; [hey ] [world]
(check-expect (edit editor-ex1 "right") (make-editor "hello w" "orld")) ; [hello w] [orld]
(check-expect (edit editor-ex5 "right") (make-editor "h" "ello")) ; [h] [ello]
(check-expect (edit editor-ex4 "right") (make-editor "hello" "")) ; [hello] []
(check-expect (edit editor-ex1 "\t") (make-editor "hello " "world"))    ; [hello ] [world] 
(check-expect (edit editor-ex1 "\r") (make-editor "hello " "world"))    ; [hello ] [world] 

(define (edit ed ke) 
  (cond
    [ (and (> (string-length ke) 1) (or (equal? ke "left") (equal? ke "right")))  ; cursor
      (cond
        [(or (and (equal? ke "left") (< (string-length (editor-pre ed)) 1)) (and  (equal? ke "right") (< (string-length (editor-post ed)) 1)) )
         (make-editor (editor-pre ed) (editor-post ed))]

        [(equal? ke "left")  (make-editor (string-delete (editor-pre ed) (- (string-length (editor-pre ed)) 1))
                                          (string-insert (string-last (editor-pre ed)) (editor-post ed) 0)  )]  
        [(equal? ke "right") (make-editor (string-insert (string-first (editor-post ed)) (editor-pre ed)  (string-length (editor-pre ed)))
                                          (string-delete (editor-post ed) 0)   
                                          )]
       )
     ]
     [ (equal? ke "\b") (make-editor (string-delete (editor-pre ed) (- (string-length (editor-pre ed)) 1)) (editor-post ed)) ] ; backspace
     [ (or (equal? ke "\t") (equal? ke "\r")) (make-editor (editor-pre ed) (editor-post ed))] ; ignores tab and return key's.
     [ (equal? (string-length ke) 1) (make-editor (string-insert ke (editor-pre ed) (string-length (editor-pre ed))) (editor-post ed)) ] ; allphabet keys
     [else (make-editor (editor-pre ed) (editor-post ed))] ; all other keys
   )  
  )

; -----  Auxiliary functions below  -----

; str-pos is a Number
; interpretation is position in a String.
; Ex:
(define str-pos-ex1 "0")
(define str-pos-ex2 "5")

; a 1String is https://htdp.org/2018-01-06/Book/part_one.html#%28tech._1string%29

; String -> 1String
; extracts the last 1String from a non-empty string. 
(define (string-last str)
  (cond
    [(and (string? str) (> (string-length str) 0)) (string-ith str (- (string-length str) 1))]
    ))

; String str-pos -> String
; deletes the String at str-pos of str.
; str-pos starts at 0.
(define (string-delete str str-pos)
  (if (> (string-length str) 0)
      (string-append (substring str 0 str-pos) (substring str (+ str-pos 1) (string-length str)))
      (string-append str)
      ))


; String String str-pos -> String
; insert s1 into str-pos of s2.
(define (string-insert s1 s2 str-pos )
  (string-append (substring s2 0 str-pos) s1 (substring s2 str-pos (string-length s2)))
  )

; String -> 1String
; Extracts the first 1String of str
(define (string-first str)
  (cond
    [(and (string? str) (>(string-length str) 0)) (string-ith str 0)]
    )
  )