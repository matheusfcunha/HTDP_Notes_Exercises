;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise_47_custom) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 47. http://www.htdp.org/2018-01-06/Book/part_one.html#%28counter._%28exercise._design14%29%29
; Version 2

(define HAPPINESS-MAX-LVL 200)
(define HAPPINESS-BAR-WIDTH 500)
(define HAPPINESS-BAR-HEIGHT 50)
(define HAPPINESS-BAR (rectangle HAPPINESS-BAR-WIDTH HAPPINESS-BAR-HEIGHT "solid" "red"))
(define BACKGROUND (empty-scene HAPPINESS-BAR-WIDTH HAPPINESS-BAR-HEIGHT "black"))
(define HAPPINESS-DISPLAY-MAX (/ HAPPINESS-BAR-WIDTH 2))

(define HAPPINESS-BAR-Y (/ HAPPINESS-BAR-HEIGHT 2))
(define HAPPINESS-DECREASE-BY-SECOND 0.9)
(define HAPPINESS-SMALL-INCREASE (/ 1 5)) ; 1/5 of the actual score
(define HAPPINESS-BIG-INCREASE (/ 1 3))   ; 1/3 of the actual score

; WorldState is a Number
; interpretation is happiness score

; WorldState -> WorldState
; Launches the program with given maximum level of happiness.
(define (gauge-prog ws)
  (big-bang ws
    [on-tick decrease-happiness]
    [to-draw render]
    [on-key  increase-happiness]
    )
  )

; WorldState -> WorldState
; Decreases the Happiness score by HAPINESS-DECREASE-BY-SECOND on every clock tick. Doesn't decrease more than 0
(check-expect (decrease-happiness 50) (- 50 HAPPINESS-DECREASE-BY-SECOND))
(check-expect (decrease-happiness 100) (- 100 HAPPINESS-DECREASE-BY-SECOND))
(check-expect (decrease-happiness 1) (- 1 HAPPINESS-DECREASE-BY-SECOND))
(check-expect (decrease-happiness 0) 0)
(check-expect (decrease-happiness -1) 0)
(define (decrease-happiness ws)
  (cond
    [(<= ws 0) 0]
    [else (- ws HAPPINESS-DECREASE-BY-SECOND)])
  )

; WorldState -> Image
; interpretation is, image of Happiness Bar on given worldState(score)
; Render the happiness bar on the BACKGROUND X Y based on worldstate (happiness score)
; if actual score (world state) is more than max score, render at edge of background
(check-expect (render HAPPINESS-MAX-LVL) (place-image HAPPINESS-BAR HAPPINESS-DISPLAY-MAX HAPPINESS-BAR-Y BACKGROUND))
(check-expect (render 0) (place-image HAPPINESS-BAR (- HAPPINESS-DISPLAY-MAX HAPPINESS-BAR-WIDTH) HAPPINESS-BAR-Y BACKGROUND))
(check-expect (render (+ HAPPINESS-MAX-LVL 20)) (place-image HAPPINESS-BAR HAPPINESS-DISPLAY-MAX HAPPINESS-BAR-Y BACKGROUND))
(define (render ws)
  (cond
    [(> ws HAPPINESS-MAX-LVL)  (place-image HAPPINESS-BAR (convert-score HAPPINESS-MAX-LVL) HAPPINESS-BAR-Y BACKGROUND)]
    [else (place-image HAPPINESS-BAR (convert-score ws) HAPPINESS-BAR-Y BACKGROUND)]) 
  )

; WorldState -> Number
; interpretation is BACKGROUND X position for (place-image) at (render ws)
; Convert the score into the X position stated above
(check-expect (convert-score HAPPINESS-MAX-LVL) HAPPINESS-DISPLAY-MAX)
(check-expect (convert-score (/ HAPPINESS-MAX-LVL 2)) 0)
(check-expect (convert-score 0) (- HAPPINESS-DISPLAY-MAX HAPPINESS-BAR-WIDTH))
(define (convert-score ws) ; convert formula: (bar-widht / max score) * actual score - 250
  ( - (* (/ HAPPINESS-BAR-WIDTH HAPPINESS-MAX-LVL) ws) HAPPINESS-DISPLAY-MAX) 
  )

; WorldState -> WorldState
; Increase Happiness score by HAPPINESS-SMALL-INCREASE on Keyboard down key
; Increase Happiness score by HAPPINESS-BIG-INCREASE on Keyboard up key
(check-expect (increase-happiness 100 "down") 120)
(check-expect (increase-happiness 0 "down")  0)
(check-expect (increase-happiness 150 "up") 200)
(check-expect (increase-happiness 0 "up") 0)
(check-expect (increase-happiness 100 "right") 100)
(define (increase-happiness ws key-event)
  (cond
    [(< ws HAPPINESS-MAX-LVL)   (cond
    
    [(key=? key-event "down") (+ (* ws HAPPINESS-SMALL-INCREASE) ws)] ; increase happiness by 1/5 of actual score on down arrow key
    [(key=? key-event "up") (+ (* ws HAPPINESS-BIG-INCREASE) ws)]     ; increase happiness by 1/3 of actual score on up arrow key
    [else ws]) ; increase happiness by 1/3 of actual score on up arrow key
                  ]
    [else ws])
  )

(gauge-prog HAPPINESS-MAX-LVL)