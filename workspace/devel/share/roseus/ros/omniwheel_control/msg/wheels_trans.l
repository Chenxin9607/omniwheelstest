;; Auto-generated. Do not edit!


(when (boundp 'omniwheel_control::wheels_trans)
  (if (not (find-package "OMNIWHEEL_CONTROL"))
    (make-package "OMNIWHEEL_CONTROL"))
  (shadow 'wheels_trans (find-package "OMNIWHEEL_CONTROL")))
(unless (find-package "OMNIWHEEL_CONTROL::WHEELS_TRANS")
  (make-package "OMNIWHEEL_CONTROL::WHEELS_TRANS"))

(in-package "ROS")
;;//! \htmlinclude wheels_trans.msg.html


(defclass omniwheel_control::wheels_trans
  :super ros::object
  :slots (_wID _wcenterx _wcentery _angle ))

(defmethod omniwheel_control::wheels_trans
  (:init
   (&key
    ((:wID __wID) (make-array 0 :initial-element 0 :element-type :integer))
    ((:wcenterx __wcenterx) 0)
    ((:wcentery __wcentery) 0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _wID __wID)
   (setq _wcenterx (round __wcenterx))
   (setq _wcentery (round __wcentery))
   (setq _angle (float __angle))
   self)
  (:wID
   (&optional __wID)
   (if __wID (setq _wID __wID)) _wID)
  (:wcenterx
   (&optional __wcenterx)
   (if __wcenterx (setq _wcenterx __wcenterx)) _wcenterx)
  (:wcentery
   (&optional __wcentery)
   (if __wcentery (setq _wcentery __wcentery)) _wcentery)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; int32[] _wID
    (* 4    (length _wID)) 4
    ;; int32 _wcenterx
    4
    ;; int32 _wcentery
    4
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _wID
     (write-long (length _wID) s)
     (dotimes (i (length _wID))
       (write-long (elt _wID i) s)
       )
     ;; int32 _wcenterx
       (write-long _wcenterx s)
     ;; int32 _wcentery
       (write-long _wcentery s)
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _wID
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _wID (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _wID i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _wcenterx
     (setq _wcenterx (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _wcentery
     (setq _wcentery (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get omniwheel_control::wheels_trans :md5sum-) "c432407a8349c63fa0f07653bd392f4a")
(setf (get omniwheel_control::wheels_trans :datatype-) "omniwheel_control/wheels_trans")
(setf (get omniwheel_control::wheels_trans :definition-)
      "int32[] wID
int32 wcenterx
int32 wcentery
float64 angle

")



(provide :omniwheel_control/wheels_trans "c432407a8349c63fa0f07653bd392f4a")


