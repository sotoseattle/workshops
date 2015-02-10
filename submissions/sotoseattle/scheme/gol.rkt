#lang racket
(require rackunit)
;(require racket/trace)


; 8 neighboring cells around a cell
(define neighbors
  (lambda (cell)
    (define x (x_coord cell))
    (define y (y_coord cell))
    (cons (cons (+ x 1) (cons (- y 1) '()))
    (cons (cons (+ x 1) (cons y '()))
    (cons (cons (+ x 1) (cons (+ y 1) '()))
    (cons (cons x (cons (- y 1) '()))
    (cons (cons x (cons (+ y 1) '()))
    (cons (cons (- x 1) (cons (- y 1) '()))
    (cons (cons (- x 1) (cons y '()))
    (cons (cons (- x 1) (cons (+ y 1) '())) '()))))))))))

(module+ test
  (check-equal? (neighbors '(0 0)) '((1 -1) (1 0) (1 1) (0 -1) (0 1) (-1 -1) (-1 0) (-1 1))))

(define x_coord
  (lambda (cell)
    (car cell)))

(define y_coord
  (lambda (cell)
    (car (cdr cell))))

(define same-cell?
  (lambda (c1 c2)
    (and (eq? (x_coord c1) (x_coord c2)) (eq? (y_coord c1) (y_coord c2)))))

; does a board include a specific cell?
(define include?
  (lambda (cell board)
    (cond
      [(null? board) #f]
      [else (or (same-cell? cell (car board))
                (include? cell (cdr board)))])))

(module+ test
  [check-true (include? '(1 1) '((0 0) (2 1) (1 1) (-1 -1)))]
  [check-true (include? '(1 1) '((1 1)))]
  [check-false (include? '(1 1) '())]
  [check-false (include? '(1 1) '((2 2)))]
  )

; count the number of living neighbors around a cell
(define number-alive?
  (lambda (n cells living)
    (cond
      [(null? cells) n]
      [else 
       (cond
         [(include? (car cells) living) (number-alive? (+ n 1) (cdr cells) living)]
         [else (number-alive? n (cdr cells) living)])])))

(define living-neigbors
  (lambda (cell living)
    (number-alive? 0 (neighbors cell) living)))

(module+ test
  [check-equal? 2 (living-neigbors '(0 0) '((0 0) (2 1) (1 1) (-1 -1)))]
  [check-equal? 8 (living-neigbors '(0 0) '((1 -1) (1 0) (1 1) (0 -1) (0 1) (-1 -1) (-1 0) (-1 1)))])

; Rule 1: say if a cell will be alive after a tick of the clock
(define alive?
  (lambda (cell board)
    (cond
      [(or (eq? 2 (living-neigbors cell board))
           (eq? 3 (living-neigbors cell board))) #t]
      [else #f])))

; new list with living cells after a tick (only apply Rule 1)
;(define staying_alive
;  (lambda (board)
;    (define new_board '())
    
    

