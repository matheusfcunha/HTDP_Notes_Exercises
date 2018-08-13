;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_83) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 83. https://htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._struct-edit0%29%29

(define EMPTSCN-WIDTH 200)
(define EMPTSCN-HEIGHT 20)
(define EMPTSCN (empty-scene EMPTSCN-WIDTH EMPTSCN-HEIGHT)) ; Place where the text is going to be rendered.
(define TEXT-SIZE 11)
(define TEXT-COLOR "black")
(define CURSOR (rectangle 1 20 "solid" "red"))


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

; Editor -> Image
; Render the Editor text and the cursor inside Image.
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
 
