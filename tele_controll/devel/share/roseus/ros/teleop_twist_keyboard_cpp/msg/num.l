;; Auto-generated. Do not edit!


(when (boundp 'teleop_twist_keyboard_cpp::num)
  (if (not (find-package "TELEOP_TWIST_KEYBOARD_CPP"))
    (make-package "TELEOP_TWIST_KEYBOARD_CPP"))
  (shadow 'num (find-package "TELEOP_TWIST_KEYBOARD_CPP")))
(unless (find-package "TELEOP_TWIST_KEYBOARD_CPP::NUM")
  (make-package "TELEOP_TWIST_KEYBOARD_CPP::NUM"))

(in-package "ROS")
;;//! \htmlinclude num.msg.html


(defclass teleop_twist_keyboard_cpp::num
  :super ros::object
  :slots (_cell ))

(defmethod teleop_twist_keyboard_cpp::num
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

(setf (get teleop_twist_keyboard_cpp::num :md5sum-) "289056e7a02f898217ead636fc3f6d34")
(setf (get teleop_twist_keyboard_cpp::num :datatype-) "teleop_twist_keyboard_cpp/num")
(setf (get teleop_twist_keyboard_cpp::num :definition-)
      "int8 cell
")



(provide :teleop_twist_keyboard_cpp/num "289056e7a02f898217ead636fc3f6d34")


