;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise_103) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Exercise 103 https://htdp.org/2018-01-06/Book/part_one.html#%28counter._mix._%28exercise._mix-zoo%29%29



; ZooAnimal is one of:
; - Spider          (Struct)
; - Elephant        (TransportSpace)
; - BoaConstrictor  (Struct)
; - Armadillo       (Struct)
; Interpretation and Examples: See data definitions of each.

; 3dSize is a structure
 (define-struct 3d-size [width length height]) ; largura comprimento altura
; (make-3d-size Number Number Number)
; Interpretation is: Size of a 3D space/object,
; All fields represented in Centimeters.
; Examples:
(define 3d-size-example1 (make-3d-size 10 10 10))
(define 3d-size-example2 (make-3d-size 100 100 100))
(define 3d-size-example3 (make-3d-size 1000 1000 1000))
(define 3d-size-example4 (make-3d-size 2000 2000 2000))



; TransportSpace is a 3dSize
; (make-3d-size w l h)
; Interpretation is: Space needed for transportation of an ZooAnimal in terms of width, length and height (w, l, h).
; Examples: (See 3dSize examples)

; Cage is a 3dSize
; (make-3d-size w l h)
; Interpretation is: Size of a Cage in terms of width, length and height (w, l, h).
; Examples: (See 3dSize Examples)

; Spider is a structure
(define-struct spider [legs transport-space])
; (make-spider Number TransportSpace)
; interpretation is a spider and it's attributes:
; - 'legs': number of remaining legs on the spider (not total legs).
; - 'transport-space': See TransporSpace interpretation.
; Examples:
(define spider-example1 (make-spider 5 (make-3d-size 15 20 20)))

; BoaConstrictor is a Structure
(define-struct boa-constrictor [length girth])
; (make-boa-constrictor Number Number)
; interpretation is a boa constrictor and it's attributes
; - 'length': represented in Centimeters
; - 'girth': represented in Centimeters
; Examples:
(define boa-constrictor-example1 (make-boa-constrictor 100 10))

; Armadillo is a Structure
(define-struct armadillo [weight transport-space])
; (make-armadillo Number TransportSpace)
; interpretation is a armadillo and it's attributes
; - 'weight': represented in Kilograms
; - 'transport-space': See TransportSpace interpretation.
; Examples:
(define armadillo-example1 (make-armadillo 5 (make-3d-size 50 100 25)))

; ZooAnimal -> ???
; Template for functions that it's input is ZooAnimal
;(define (template-function animal)
;  (cond
;    [(spider? animal) ...(spider-legs animal)... ...(template-transport-space (transport-space animal))...]
;    [(transport-space? animal) ...(template-transport-space (transport-space animal))...]
;    [(boa-constrictor? animal) ...(boa-constrictor-length animal)... ...(boa-constrictor-girth animal)...]
;    [(armadillo? animal) ...(armadillo-weight)... ...(template-transport-space (transport-space animal))...])
;  )

; TransportSpace -> ???
; Template for functions that it's input is TransportSpace
;(define (template-transport-space ts)
;  ...(3d-size-width ts)...
;  ...(3d-size-length ts)...
;  ...(3d-size-height ts)....
;  )

; ZooAnimal Cage -> Boolean
; determines whether c volume is large enough for za.
(check-expect (fits? spider-example1 3d-size-example2) #true)
(check-expect (fits? 3d-size-example3 3d-size-example4) #true)
(check-expect (fits? boa-constrictor-example1 3d-size-example4) #true)
(check-expect (fits? armadillo-example1 3d-size-example3) #true)
(check-expect (fits? spider-example1 3d-size-example1) #false)
(check-expect (fits? 3d-size-example3 3d-size-example1) #false)
(check-expect (fits? boa-constrictor-example1 3d-size-example1) #false)
(check-expect (fits? armadillo-example1 3d-size-example1) #false)
(define (fits? za c)
  (cond
    [(spider? za) (>= (volume c) (volume (spider-transport-space za))) ]  ; Spider
    [(3d-size? za) (>= (volume c) (volume  za))]                          ; Elephant
    [(boa-constrictor? za)  (>= (volume c) (volume (make-3d-size (/ (boa-constrictor-girth za) pi) (boa-constrictor-length za) (/ (boa-constrictor-girth za) pi))))  ] ; BoaConstrictor
    [(armadillo? za) (>= (volume c) (volume (armadillo-transport-space za)))] ; Armadillo
    )
  )

; 3dSize -> Number
; determine obj volume.
(define (volume obj)
  (* (3d-size-width obj) (3d-size-length obj) (3d-size-height obj))  
  )
