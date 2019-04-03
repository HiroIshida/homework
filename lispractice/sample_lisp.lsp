;; homework p36
; chapter 9
; what operator is suitable for x in 
; 1) (car x (cdr '(a (b c) d))) which returns `b`
(defun x (lst) (car (car lst)))
; 2) (x 13 (/ 1 10)) which returns `13`
; 3) (x #'lsit 1 nil) which returns `(1)`


(defclass rat
  :super propertied-object
  :slots ((numer :type :integer)
          (denom :type :integer)))

(defmethod rat
  (:init
    (n d)
    (setq numer n)
    (setq denom d)
    self)
  (:numer () numer)
  (:denom () denom)
  )


(defun addrat (rat_a rat_b)
  (instance rat :init
            (+ (*(send rat_a :numer)(send rat_b :denom)) (*(send rat_b :numer)(send rat_a :denom)))
            (* (send rat_a :numer)(send rat_b :denom))))

(setq rat1 (instance rat :init 1 2))
(setq rat2 (instance rat :init 3 4))
(setq rat_new (addrat rat1 rat2))





