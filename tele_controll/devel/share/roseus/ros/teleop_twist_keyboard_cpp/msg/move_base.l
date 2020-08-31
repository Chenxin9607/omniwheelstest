;; Auto-generated. Do not edit!


(when (boundp 'teleop_twist_keyboard_cpp::move_base)
  (if (not (find-package "TELEOP_TWIST_KEYBOARD_CPP"))
    (make-package "TELEOP_TWIST_KEYBOARD_CPP"))
  (shadow 'move_base (find-package "TELEOP_TWIST_KEYBOARD_CPP")))
(unless (find-package "TELEOP_TWIST_KEYBOARD_CPP::MOVE_BASE")
  (make-package "TELEOP_TWIST_KEYBOARD_CPP::MOVE_BASE"))

(in-package "ROS")
;;//! \htmlinclude move_base.msg.html


(defclass teleop_twist_keyboard_cpp::move_base
  :super ros::object
  :slots (_v_right _v_left _v_back ))

(defmethod teleop_twist_keyboard_cpp::move_base
  (:init
   (&key
    ((:v_right __v_right) 0)
    ((:v_left __v_left) 0)
    ((:v_back __v_back) 0)
    )
   (send-super :init)
   (setq _v_right (round __v_right))
   (setq _v_left (round __v_left))
   (setq _v_back (round __v_back))
   self)
  (:v_right
   (&optional __v_right)
   (if __v_right (setq _v_right __v_right)) _v_right)
  (:v_left
   (&optional __v_left)
   (if __v_left (setq _v_left __v_left)) _v_left)
  (:v_back
   (&optional __v_back)
   (if __v_back (setq _v_back __v_back)) _v_back)
  (:serialization-length
   ()
   (+
    ;; int64 _v_right
    8
    ;; int64 _v_left
    8
    ;; int64 _v_back
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _v_right
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _v_right (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _v_right) (= (length (_v_right . bv)) 2)) ;; bignum
              (write-long (ash (elt (_v_right . bv) 0) 0) s)
              (write-long (ash (elt (_v_right . bv) 1) -1) s))
             ((and (class _v_right) (= (length (_v_right . bv)) 1)) ;; big1
              (write-long (elt (_v_right . bv) 0) s)
              (write-long (if (>= _v_right 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _v_right s)(write-long (if (>= _v_right 0) 0 #xffffffff) s)))
     ;; int64 _v_left
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _v_left (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _v_left) (= (length (_v_left . bv)) 2)) ;; bignum
              (write-long (ash (elt (_v_left . bv) 0) 0) s)
              (write-long (ash (elt (_v_left . bv) 1) -1) s))
             ((and (class _v_left) (= (length (_v_left . bv)) 1)) ;; big1
              (write-long (elt (_v_left . bv) 0) s)
              (write-long (if (>= _v_left 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _v_left s)(write-long (if (>= _v_left 0) 0 #xffffffff) s)))
     ;; int64 _v_back
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _v_back (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _v_back) (= (length (_v_back . bv)) 2)) ;; bignum
              (write-long (ash (elt (_v_back . bv) 0) 0) s)
              (write-long (ash (elt (_v_back . bv) 1) -1) s))
             ((and (class _v_back) (= (length (_v_back . bv)) 1)) ;; big1
              (write-long (elt (_v_back . bv) 0) s)
              (write-long (if (>= _v_back 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _v_back s)(write-long (if (>= _v_back 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _v_right
#+(or :alpha :irix6 :x86_64)
      (setf _v_right (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _v_right (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _v_left
#+(or :alpha :irix6 :x86_64)
      (setf _v_left (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _v_left (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _v_back
#+(or :alpha :irix6 :x86_64)
      (setf _v_back (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _v_back (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get teleop_twist_keyboard_cpp::move_base :md5sum-) "e7eb46e0f2c9f6ac4de66b4a1727ce26")
(setf (get teleop_twist_keyboard_cpp::move_base :datatype-) "teleop_twist_keyboard_cpp/move_base")
(setf (get teleop_twist_keyboard_cpp::move_base :definition-)
      "int64 v_right
int64 v_left
int64 v_back
")



(provide :teleop_twist_keyboard_cpp/move_base "e7eb46e0f2c9f6ac4de66b4a1727ce26")


