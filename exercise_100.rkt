;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_100) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; -----------------------------------    CONSTANTS   --------------------------------------------
(define BACKGROUND-WIDTH 200)
(define BACKGROUND-HEIGHT 200)
(define BACKGROUND (empty-scene BACKGROUND-WIDTH BACKGROUND-HEIGHT))
(define UFO-IMG-SIZE 10)
(define TANK-Y-POS 185)
(define TANK-IMG (rectangle 40 30 "solid" "blue"))
(define TANK-SPEED 3) 
(define TANK-MINIMUM-X 15)
(define TANK-MAX-X 185)
(define UFO-Y-SPEED 3)
(define UFO-IMG (circle UFO-IMG-SIZE "solid" "green"))
(define UFO-MINIMUM-X 15)
(define UFO-MAX-X 185)
(define UFO-Y-LIMIT (- (- BACKGROUND-HEIGHT UFO-IMG-SIZE) 5))
(define UFO-MAX-JUMP 10)
(define MISSILE-IMG-SIZE 15)
(define MISSILE-IMG (triangle MISSILE-IMG-SIZE "solid" "black"))
(define MISSILE-SPEED 6)

; ------------------------------      DATA DEFINITIONS    ------------------------------------------
; A UFO is a Posn, interval is:
; - x: [UFO-IMG-SIZE + 5, BACKGROUND-WIDTH - (UFO-IMG-SIZE + 5)]  [15, 185]
; - y: [UFO-IMG-SIZE + 5, UFO-Y-LIMIT]       [15, 185]
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
; Examples:
(define ufo-ex1 (make-posn 15 15))
(define ufo-ex2 (make-posn 15 185))
(define ufo-ex3 (make-posn 185 15))
(define ufo-ex4 (make-posn 100 100))
(define ufo-ex5 (make-posn 185 185))
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; x  - [15, 185];  x coordinate location on BACKGROUND.   [TANK-MINIMUM-X, TANK-MAX-X]
; dx is either -3 or 3; tank's speed/direction: dx pixels/tick
; Examples:
(define tank-ex1 (make-tank 15 -3))
(define tank-ex2 (make-tank 100 -3))
(define tank-ex3 (make-tank 185 -3))
(define tank-ex4 (make-tank 15 3))
(define tank-ex5 (make-tank 100 3))
(define tank-ex6 (make-tank 185 3))

; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place,
; x is tank actual position, y is position from top to bottom
; x - [15, 185]
; y - [15, 185]
; Examples:
(define missile-ex1 (make-posn 15 15))
(define missile-ex2 (make-posn 15 185))
(define missile-ex3 (make-posn 185 15))
(define missile-ex4 (make-posn 100 100))
(define missile-ex5 (make-posn 185 185))


(define-struct aim [ufo tank])
; Aim is a structure.
; (make-aim UFO Tank)
; interpretation worldState(s) before the missile is fired.
; Examples:
(define aim-ex1 (make-aim ufo-ex1 tank-ex1))
(define aim-ex2 (make-aim ufo-ex4 tank-ex5))
(define aim-ex3 (make-aim ufo-ex5 tank-ex5))
(define aim-ex4 (make-aim ufo-ex5 tank-ex6))
(define aim-ex5 (make-aim ufo-ex3 tank-ex6))
(define aim-ex6 (make-aim ufo-ex4 tank-ex2))

(define-struct fired [ufo tank missile])
; Fired is a structure.
; (make-fired UFO Tank Missile)
; interpretation is, WorldState(s) after the missile is fired.
; Examples: 
(define fired-ex1 (make-fired ufo-ex1 tank-ex1 missile-ex1))
(define fired-ex2 (make-fired ufo-ex4 tank-ex5 missile-ex4))
(define fired-ex3 (make-fired ufo-ex5 tank-ex5 missile-ex3))
(define fired-ex4 (make-fired ufo-ex5 tank-ex6 missile-ex5))


; a UFO-JUMP is a Number
; interval is [-10, UFO-MAX-JUMP]
; interpretation is, Number of pixels that UFO is going to jump on axis X.
; Examples:
(define ufo-jump-ex1 10)
(define ufo-jump-ex2 5)
(define ufo-jump-ex3 0)
(define ufo-jump-ex4 -5)
(define ufo-jump-ex5 -10)

; A SIGS is one of: 
; – Aim;   (make-aim UFO Tank)
; – Fired; (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game


; ------------------------------------     FUNCTIONS       ----------------------------------------------

; SIGS -> SIGS
; Launche space invader game on some SIGS AIM default state.
(define (space-invader sigs)
  (big-bang sigs
    [on-tick si-move]
    [to-draw si-render]
    [on-key si-control]
    [stop-when si-game-over?]))

; SIGS -> Image
; adds TANK, UFO, and possibly MISSILE to 
; the BACKGROUND scene
(check-expect (si-render aim-ex1) (tank-render (aim-tank aim-ex1) (ufo-render (aim-ufo aim-ex1) BACKGROUND)) )
(check-expect (si-render fired-ex1) (tank-render (fired-tank fired-ex1) (ufo-render (fired-ufo fired-ex1) (missile-render (fired-missile fired-ex1) BACKGROUND))))

(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render
       (fired-tank s)
       (ufo-render (fired-ufo s)
                   (missile-render (fired-missile s)
                                   BACKGROUND)))]))

; SIGS -> Boolean
; Check if the game is over. The game is over when the ufo lands, or if the missile 'hits' the ufo.
(check-expect (si-game-over? aim-ex1) #false)
(check-expect (si-game-over? aim-ex3) #true)
(check-expect (si-game-over? fired-ex1) #false)
(check-expect (si-game-over? fired-ex3) #true)
(check-expect (si-game-over? (make-fired ufo-ex1 tank-ex1 (make-posn 15 35))) #false) ; almost game over
(check-expect (si-game-over? (make-fired ufo-ex1 tank-ex1 (make-posn 15 30))) #true) ; game over
(define (si-game-over? s)
  (cond
    [(aim? s) (ufo-landed? (aim-ufo s))]
    [(fired? s) (or (ufo-landed? (fired-ufo s)) (ufo-got-hit? (fired-ufo s) (fired-missile s)))]
    )
  )

; SIGS -> SIGS
; For every clock tick, determine to which position the objects move now.
; Tank and Missile (if any), moves in constant speeds.
; UFO make small jumps to right or left of the canvas.
(define (si-move s)
  
  (si-move-proper s (generate-ufo-jump UFO-MAX-JUMP)))     ; separate si-move and its proper functionality into two parts for testing without RANDOM numbers.

; SIGS UFO-JUMP -> SIGS 
; moves the space-invader objects predictably by ufo-x-delta
(check-expect (si-move-proper aim-ex1 ufo-jump-ex1) (make-aim (make-posn 25 18) (make-tank 18 3)))    ; (define ufo-ex1 (make-posn 15 15))   (define tank-ex1 (make-tank 15 -3))
(check-expect (si-move-proper aim-ex1 ufo-jump-ex3) (make-aim (make-posn 15 18) (make-tank 18 3)))
(check-expect (si-move-proper aim-ex1 ufo-jump-ex5) (make-aim (make-posn 25 18) (make-tank 18 3)))
(check-expect (si-move-proper aim-ex1 ufo-jump-ex5) (make-aim (make-posn 25 18) (make-tank 18 3)))
(check-expect (si-move-proper aim-ex2 ufo-jump-ex2) (make-aim (make-posn 105 103) (make-tank 103 3)))   ; (define ufo-ex4 (make-posn 100 100))  (define missile-ex4 (make-posn 100 100))
(check-expect (si-move-proper aim-ex2 ufo-jump-ex4) (make-aim (make-posn 95 103) (make-tank 103 3)))
(check-expect (si-move-proper (make-aim ufo-ex3 tank-ex6) ufo-jump-ex1) (make-aim (make-posn 175 18) (make-tank 182 -3)))   ; (define ufo-ex3 (make-posn 185 15)) (make-tank 185 3)
(check-expect (si-move-proper (make-aim ufo-ex3 tank-ex6) ufo-jump-ex2) (make-aim (make-posn 180 18) (make-tank 182 -3)))
; (check-expect (si-move-proper (make-aim ufo-ex3 tank-ex3) ufo-jump-ex2) (make-aim (make-posn 180 18) (make-tank 182 -3))) 
(check-expect (si-move-proper (make-fired ufo-ex1 tank-ex1 (make-posn 15 100)) ufo-jump-ex1) (make-fired (make-posn 25 18) (make-tank 18 3) (make-posn 15 94) ))
(define (si-move-proper s ufo-x-delta)      
  (cond
    [(aim? s) (make-aim (move-ufo (aim-ufo s) ufo-x-delta) (move-tank (aim-tank s)) ) ]
    [(fired? s) (make-fired (move-ufo (fired-ufo s) ufo-x-delta) (move-tank (fired-tank s)) (move-missile (fired-missile s)))]
    )
  )

; SIGS KeyEvent -> SIGS
; Moves the tank to left or right when ke is arrow keys, or fire the missile on space ke.
(check-expect (si-control aim-ex2 "left") (make-aim (aim-ufo aim-ex2) (make-tank (tank-loc (aim-tank aim-ex2)) -3)))
(check-expect (si-control aim-ex6 "left") (make-aim (aim-ufo aim-ex6) (make-tank (tank-loc (aim-tank aim-ex6)) -3)))
(check-expect (si-control aim-ex2 "right") (make-aim (aim-ufo aim-ex2) (make-tank (tank-loc (aim-tank aim-ex2)) 3)))
(check-expect (si-control aim-ex6 "right") (make-aim (aim-ufo aim-ex6) (make-tank (tank-loc (aim-tank aim-ex6)) 3))) 
(check-expect (si-control aim-ex2 " ") (make-fired (aim-ufo aim-ex2) (aim-tank aim-ex2) (make-posn 100 185) ))
(define (si-control s ke)
  (cond
    [(aim? s) (cond
                [(and (equal? ke "left")  (positive? (tank-vel (aim-tank s))))  (make-aim (aim-ufo s) (change-tank-direction (aim-tank s)))]
                [(and (equal? ke "right") (negative? (tank-vel (aim-tank s))))  (make-aim (aim-ufo s) (change-tank-direction (aim-tank s)))]
                [(equal? ke " ")      (make-fired     (aim-ufo s) (aim-tank s) (make-posn (tank-loc (aim-tank s)) TANK-Y-POS)) ]
                [else s]
                )]
    [else s]
    )
  )

; Tank -> Tank
; Change t movement direction (on X coordinate) .
(define (change-tank-direction t)
  (cond
    [(positive? (tank-vel t)) (make-tank (tank-loc t) (- (tank-vel t)  (* TANK-SPEED 2 ))) ]
    [(negative? (tank-vel t))  (make-tank (tank-loc t) (+ (tank-vel t) (* TANK-SPEED 2 )))]
    )
  )

; ----------------------------------       HELPER/AUXILIARY FUNCTIONS        ------------------------------------------


; Tank Image -> Image 
; adds t to the given image im
(check-expect (tank-render tank-ex1 BACKGROUND) (place-image TANK-IMG (tank-loc tank-ex1) TANK-Y-POS BACKGROUND))
(define (tank-render t im)
  (place-image TANK-IMG (tank-loc t) TANK-Y-POS im))
 
; UFO Image -> Image 
; adds u to the given image im
(check-expect (ufo-render ufo-ex1 BACKGROUND) (place-image UFO-IMG (posn-x ufo-ex1) (posn-y ufo-ex1) BACKGROUND))
(define (ufo-render u im)
  (place-image UFO-IMG (posn-x u) (posn-y u) im))

; Missile Image -> Image 
; adds m to the given image im
(check-expect (missile-render missile-ex1 BACKGROUND) (place-image MISSILE-IMG (posn-x missile-ex1) (posn-y missile-ex1) BACKGROUND))
(define (missile-render m im)
  (place-image MISSILE-IMG (posn-x m) (posn-y m) im))

; UFO -> Boolean
; check if the UFO 'landed' (reached UFO-Y-LIMIT)
(check-expect (ufo-landed? ufo-ex1) #false)
(check-expect (ufo-landed? ufo-ex2) #true)
(check-expect (ufo-landed? ufo-ex3) #false)
(check-expect (ufo-landed? ufo-ex4) #false)
(check-expect (ufo-landed? ufo-ex5) #true)
(check-expect (ufo-landed? (make-posn 100 184)) #false)
(define (ufo-landed? u)
 (>= (posn-y u) UFO-Y-LIMIT)
  )

; UFO MISSILE -> Boolean
; Check if UFO have been hit by MISSILE
(check-expect (ufo-got-hit? ufo-ex1 (make-posn 15 35)) #false)  
(check-expect (ufo-got-hit? ufo-ex1 (make-posn 15 30)) #true)
(check-expect (ufo-got-hit? ufo-ex1 (make-posn 100 30)) #false)  
(define (ufo-got-hit? u m)
  (cond
    [(equal? (posn-x u) (posn-x m)) (equal? (posn-y u) (- (posn-y m) MISSILE-IMG-SIZE)) ]
    [else #false])
  )  

; Number -> UFO-JUMP
; Generate a Random UFO-JUMP Number, based on max-num
; if (random max-num) gives odd number, generate random negative num or 0, else generate positive num.
(define (generate-ufo-jump max-num)
  (if (odd? (random max-num)) (- (random max-num) max-num) (random max-num))
  )

; TANK -> TANK
; Move t updating it's fields, accordingly to TANK-SPEED, TANK-MINIMUM-X and TANK-MAX-X.
(check-expect (move-tank tank-ex1) (make-tank 18 3))
(check-expect (move-tank tank-ex2) (make-tank 97 -3))
(check-expect (move-tank tank-ex5) (make-tank 103 3))
(check-expect (move-tank tank-ex6) (make-tank 182 -3))
(define (move-tank t)
  (cond
    [ (or (>= (tank-loc t) TANK-MAX-X) (<= (tank-loc t) TANK-MINIMUM-X))   ; Invert Tank vel field signal.
        (make-tank (- (tank-loc t) (tank-vel t)) (- (tank-vel t) (* (tank-vel t) 2)))
      ] 
    [else (make-tank (+ (tank-loc t) (tank-vel t)) (tank-vel t) )])
  )


; UFO  UFO-JUMP -> UFO
; Move u updating it's fields, accordingly to UFO-MINIMUN-X UFO-MAX-X, UFO-SPEED-Y and u-x-delta
(check-expect (move-ufo ufo-ex1 ufo-jump-ex1) (make-posn 25 18))
(check-expect (move-ufo ufo-ex1 ufo-jump-ex3) (make-posn 15 18))
(check-expect (move-ufo ufo-ex1 ufo-jump-ex5) (make-posn 25 18))
(check-expect (move-ufo ufo-ex4 ufo-jump-ex1) (make-posn 110 103))
(check-expect (move-ufo ufo-ex4 ufo-jump-ex5) (make-posn 90 103))
(check-expect (move-ufo ufo-ex3 ufo-jump-ex1) (make-posn 175 18))
(check-expect (move-ufo ufo-ex3 ufo-jump-ex5) (make-posn 175 18))       

(define (move-ufo u u-x-delta) 
 (make-posn (cond
              [(or (> (+ (posn-x u) u-x-delta) UFO-MAX-X) (< (+ (posn-x u) u-x-delta) UFO-MINIMUM-X))           
                (- (posn-x u) u-x-delta)]
              [else (+ (posn-x u) u-x-delta)]
            )
            (+ (posn-y u) UFO-Y-SPEED))
  )

; Missile -> Missile
; Move m updating it's fields, accordingly to MISSILE-SPEED
(check-expect (move-missile missile-ex1) (make-posn 15 9))   (make-posn 15 21)
(check-expect (move-missile missile-ex2) (make-posn 15 179))
(check-expect (move-missile missile-ex4) (make-posn 100 94))
(define (move-missile m)
 (make-posn (posn-x m) (- (posn-y m) MISSILE-SPEED))
  )
  