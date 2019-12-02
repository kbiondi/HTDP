;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise39) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 200)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "white"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "black"))

(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define CAR-TOP
  (rectangle 20 7 "solid" "red"))

(define CAR-BOTTOM
  (rectangle 55 10 "solid" "red"))

(define CAR-BODY
  (above CAR-TOP CAR-BOTTOM))

(define CAR
  (overlay/align/offset "middle" "bottom" BOTH-WHEELS 0 -5 CAR-BODY))

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
;(define (render x)
;  BACKGROUND)
 
; WorldState -> WorldState
; adds 3 to x to move the car right 
(define (tock x)
  x)
 
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
(define (end? cw) ...)

; WorldState -> WorldState
; launches the program from some initial state 
;(define (main ws)
;   (big-bang ws
;     [on-tick tock]
;     [to-draw render]))