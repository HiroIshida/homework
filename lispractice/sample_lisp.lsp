;; homework 9-2
(defun show-periods (num &optional (str-period ""))
  (if (= num 0) 
    (print str-period)
    (show-periods (- num 1) (concatenate string str-period "."))))
(show-periods 4)

(defun count-simbols-a (lst)
  (if (null lst)
      0
      (let ((x (car lst)))
        (if x 
      (count-simbols-a (lst 


;;(defun how-many-a-in-the-lst? (lst))

;; homework 9-2
(defun summit (lst)
  (let ((lst-removed (remove nil lst)))
    (apply #'+ lst-removed)))
(summit (list 1 2 nil 5))

(defun summit (lst)
  (if (null lst)
      0
      (let ((x (car lst)))
        (if (null x)
            (summit (cdr lst)) 
            (+ x (summit (cdr lst)))))))
(summit (list 1 2 4 nil 6))





;; homework 9-3

;; homework 9-4
;; Object-oriented version of rational number functions
(defun get-smaller (num-a num-b)
  (if (< num-a num-b)
      num-a
      num-b))

(defun get-larger (num-a num-b)
  (if (> num-a num-b)
      num-a
      num-b))

(defun get-best (num-a num-b fn)
  (if (funcall fn num-a num-b)
      num-a
      num-b))

(defun find-greatest-common-divisor (num-a num-b)
  (let* ((num-small (get-best num-a num-b #'<))
         (num-large (get-best num-a num-b #'>))
         (remainder (mod num-large num-small)))
    (if (= remainder 0)
        num-small; return
        (find-greatest-common-divisor (mod num-large num-small) num-small))))

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
  (:denom () denom))

(defun addrat (rat-a rat-b)
  (let* ((rat-new-numer 
           (+ (* (send rat-a :numer)(send rat-b :denom))
              (*(send rat-b :numer)(send rat-a :denom))))
         (rat-new-denom
           (+ (send rat-a :denom)(send rat-b :denom)))
         (common-divisor (find-greatest-common-divisor rat-new-numer rat-new-denom)))
    (instance rat :init 
              (/ rat-new-numer common-divisor)
              (/ rat-new-denom common-divisor))))

(setq rat1 (instance rat :init 1 2))
(setq rat2 (instance rat :init 3 4))
(setq rat-new (addrat rat1 rat2))





