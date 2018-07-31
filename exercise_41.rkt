;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_41) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Physical Constants
(define WIDTH-OF-WORLD 300)
(define HEIGHT-OF-WORLD 50)
(define Y-CAR (* HEIGHT-OF-WORLD 0.85))
(define WHEEL-RADIUS 10)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND (place-image TREE 20 Y-CAR (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD)))


; Graphical Constants

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle 40 WHEEL-RADIUS "solid" "red"))
(define CAR
  (beside WHEEL SPACE WHEEL))


; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [stop-when end?]))

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
 (define (render ws)
   (place-image CAR ws Y-CAR BACKGROUND))


; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
;   given: 78, expect 81
(define (tock ws)
  (+ ws 3))

; WorldState -> Boolean
; Check if the car already passed the entire scene
(check-expect (end? 400) #true)
(define (end? ws)
  (> ws (+ WIDTH-OF-WORLD (image-width CAR)))
  )

(main 30)
