;; perhaps cascade hierarchy is like 
;; world -> pa -> ph
;; about cascaded-coords see p. 124

;; you can make an instance of cascade-coods by
;; the way that Hasegawa showed me
(setq cc-parent (make-cascoords :pos #f(100 0 0)))
(setq cc-child (send cc-parent :copy-worldcoords))
(send cc-child :transform (make-coords :pos #f(0 100 0) :rpy #f(0.1 0.1 0.1)) :local)

;; modified version using some functions
(defun make-relative-coords (c-parent &key pos rpy)
  (let ((c-child (send c-parent :copy-worldcoords)))
    (send c-child :transform (make-coords :pos pos :rpy rpy) :local)))

(setq cc-body_ (make-cascoords :pos #f(100 100 100)))
(setq cc-body (make-cascoords :pos #f(100 100 100) :rpy #f(0 0 0)))
(eq cc-body cc-body_)
(objects (list cc-body *world-coords*))


(defclass module 
  :super cascaded-link)

(defmethod module
(:init (b-base b-movable)
 (setq link1 (instance bodyset-link :init (make-cascoords) :bodies (list b-base)))
 (setq link2 (instance bodyset-link :init (make-cascoords) :bodies (list b-movable)))

 ;; joint-list and links are member of the superclass "cascaded-link"
 (setq joint-list
       (list 
         (instance linear-joint :init :parent-link b-base :child-link b-movable :axis z)))
 (setq links (list link1 link2))
 (send self :assoc link1)
 (send link1 :assoc link2)
 (send self :init-ending)))


(setq b (make-cube 10 10 10))
(send b :locate #f(0 0 0))
(setq b-base (instance bodyset-link :init (make-cascoords) :bodies (list b)))

(setq b (make-cube 10 10 10))
(send b :locate #f(5 0 0))
(setq b-movable (instance bodyset-link :init (make-cascoords) :bodies (list b)))
(setq robot (instance module :init b-base b-movable))


(load "./servo.lsp")

