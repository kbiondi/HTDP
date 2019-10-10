;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex11-20) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; Exercise 11
(define (dist x y)
  (sqrt (+ (sqr x) (sqr y))))

; Exercise 12
(define (cvolume s)
  (expt s 3))

(define (csurface s)
  (* (sqr s) 6))

; Exercise 13
(define (string-first s)
  (if (> (string-length s) 0) (string-ith s 0) "string is empty"))

; Ex 14
(define (string-last s)
  (if (> (string-length s) 0) (string-ith s (- (string-length s) 1)) "string is empty"))

