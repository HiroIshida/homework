(setq c1 (make-cube 100 100 100))
(setq c2 (make-cube 50 50 50))
(setq c3 (make-cube 50 50 50))
(send c1 :set-color :red)
(send c2 :set-color :blue)
(send c3 :set-color :yellow)
(send c2 :locate #f(300 0 0))
(send c3 :locate #f(300 100 0))
;; (send object-parent :assoc object-child &optional)
(send c1 :assoc c2) ;; let c1 has its child c2 (see p120)
;(send c2 :assoc c3)

(objects (list c1 c2))

(do-until-key
  (send c1 :rotate (deg2rad 5) :z)
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  )
  
