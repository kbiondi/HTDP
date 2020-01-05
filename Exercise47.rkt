;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise47) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 1000)
(define HEIGHT-OF-WORLD 50)

(define BACKGROUND (rectangle WIDTH-OF-WORLD HEIGHT-OF-WORLD "solid" "black"))

;(define GAUGE (rectangle ws (/ HEIGHT-OF-WORLD 2) "solid" "red"))

; A WorldState is a Number.
; x-coordinate of the right-most edge of the GAUGE

; WorldState -> Image
; places the GAUGE into the BACKGROUND scene,
; according to the given world state 
 (define (render ws)
   (overlay/align "left" "middle" (rectangle ws (/ HEIGHT-OF-WORLD 2) "solid" "red") BACKGROUND))
 
; WorldState -> WorldState
; adds 3 to world state to move the GAUGE right for every clock tick
;(check-expect (tock 20) 23)
;(check-expect (tock 78) 81)
(define (tock ws)
  (cond [(> ws WIDTH-OF-WORLD) WIDTH-OF-WORLD]
        [(>= ws 1) (- ws 1)]
        [else (+ ws 1)]))  
 
; WorldState String -> WorldState 
; for each keystroke, big-bang obtains the next state 
; from (keystroke-handler cw ke); ke represents the key
(define (increase ws ke)
  (cond
    [(key=? ke "up") (* ws 1.33)]
    [(key=? ke "down")  (* ws 1.2)]
    [else ws]))
 
; WorldState Number Number String -> WorldState 
; for each mouse gesture, big-bang obtains the next state
; from (mouse-event-handler cw x y me) where x and y are
; the coordinates of the event and me is its description 
(define (mouse-event-handler cw x y me) ...)

; WorldState Number Number String -> WorldState
; places the GAUGE at x-mouse
; if the given me is "button-down"
; given: 21 10 20 "enter"
; wanted: 21
; given: 42 10 20 "button-down"
; wanted: 10
; given: 42 10 20 "move"
; wanted: 42
; The examples say that if the string argument is
; equal to "button-down", the function returns x-mouse;
; otherwise it returns x-position-of-GAUGE.

;(check-expect (hyper 21 10 20 "enter") 21)
;(check-expect (hyper 42 10 20 "button-down") 10)
;(check-expect (hyper 42 10 20 "move") 42)
;(define (hyper x-position-of-GAUGE x-mouse y-mouse me)
;  (cond
;    [(string=? "button-down" me) x-mouse]
;    [else x-position-of-GAUGE]))
 
; WorldState -> Boolean
; after each event, big-bang evaluates (end? cw) 
;(define (end? ws) (cond
;                    [(< ws (+ (image-width BACKGROUND) (image-width GAUGE))) #false]
;                    [(>= ws (+ (image-width BACKGROUND) (image-width GAUGE))) #true]))

; WorldState -> WorldState
; launches the program from some initial state 
(define (gauge-prog ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]
     [on-key increase]
     ;[stop-when end?]
     ))
 (gauge-prog 100)