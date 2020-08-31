;; Auto-generated. Do not edit!


(when (boundp 'omniwheel_keyboard_control::num)
  (if (not (find-package "OMNIWHEEL_KEYBOARD_CONTROL"))
    (make-package "OMNIWHEEL_KEYBOARD_CONTROL"))
  (shadow 'num (find-package "OMNIWHEEL_KEYBOARD_CONTROL")))
(unless (find-package "OMNIWHEEL_KEYBOARD_CONTROL::NUM")
  (make-package "OMNIWHEEL_KEYBOARD_CONTROL::NUM"))

(in-package "ROS")
;;//! \htmlinclude num.msg.html


(defclass omniwheel_keyboard_control::num
  :super ros::object
  :slots (_cell ))

(defmethod omniwheel_keyboard_control::num
  (:init
   (&key
    ((:cell __cell) 0)
    )
   (send-super :init)
   (setq _cell (round __cell))
   self)
  (:cell
   (&optional __cell)
   (if __cell (setq _cell __cell)) _cell)
  (:serialization-length
   ()
   (+
    ;; int8 _cell
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _cell
       (write-byte _cell s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _cell
     (setq _cell (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _cell 127) (setq _cell (- _cell 256)))
   ;;
   self)
  )

(setf (get omniwheel_keyboard_control::num :md5sum-) "289056e7a02f898217ead636fc3f6d34")
(setf (get omniwheel_keyboard_control::num :datatype-) "omniwheel_keyboard_control/num")
(setf (get omniwheel_keyboard_control::num :definition-)
      "int8 cell
")



(provide :omniwheel_keyboard_control/num "289056e7a02f898217ead636fc3f6d34")


