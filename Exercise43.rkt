;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise43) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 1000)
(define WHEEL-RADIUS 9)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define Y-CAR (* WHEEL-RADIUS 3))
(define TREE
  (underlay/xy (circle WHEEL-RADIUS "solid" "green")
                WHEEL-RADIUS (* WHEEL-RADIUS 1.5)
               (rectangle 2 (* WHEEL-RADIUS 2) "solid" "brown")))

(define BACKGROUND (overlay/align "middle" "bottom" TREE
                    (rectangle WIDTH-OF-WORLD (* WHEEL-RADIUS 6) "solid" "black")))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "white"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "black"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-TOP
  (rectangle (* WHEEL-RADIUS 5) (* WHEEL-RADIUS 1.5) "solid" "red"))

(define CAR-BOTTOM
  (rectangle (* WHEEL-RADIUS 11) (* WHEEL-RADIUS 2) "solid" "red"))

(define CAR-BODY
  (above CAR-TOP CAR-BOTTOM))

(define CAR
  (overlay/align/offset "middle" "bottom" BOTH-WHEELS 0 (- WHEEL-RADIUS) CAR-BODY))


; An AnimationState is a Number.
; interpretation: the number of clock ticks 
; since the animation started

; AnimationState -> Image
; places the car into the BACKGROUND scene,
; according to the given AnimationState 
 (define (render as)
   (place-image CAR (- as (/ (image-width CAR) 2)) Y-CAR BACKGROUND))
 
; AnimationState -> AnimationState
; adds 3 to AnimationState to move the car right for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)
(define (tock as)
  (abs (round (+ (* (sin as) (/ 180 pi)) 500))))
   
 
; WorldState String -> WorldState 
; for each keystroke, big-bang obtains the next state 
; from (keystroke-handler cw ke); ke represents the key
(define (keystroke-handler cw ke) ...)
 
; WorldState Number Number String -> WorldState 
; for each mouse gesture, big-bang obtains the next state
; from (mouse-event-handler cw x y me) where x and y are
; the coordinates of the event and me is its description 
(define (mouse-event-handler cw x y me) ...)
 
; WorldState -> Boolean
; after each event, big-bang evaluates (end? cw) 
(define (end? ws) (cond
                    [(< ws (+ (image-width BACKGROUND) (image-width CAR))) #false]
                    [(>= ws (+ (image-width BACKGROUND) (image-width CAR))) #true]))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     ;[stop-when end?]
     ))