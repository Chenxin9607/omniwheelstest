; Auto-generated. Do not edit!


(cl:in-package omniwheel_control-msg)


;//! \htmlinclude move_base.msg.html

(cl:defclass <move_base> (roslisp-msg-protocol:ros-message)
  ((v_right
    :reader v_right
    :initarg :v_right
    :type cl:integer
    :initform 0)
   (v_left
    :reader v_left
    :initarg :v_left
    :type cl:integer
    :initform 0)
   (v_back
    :reader v_back
    :initarg :v_back
    :type cl:integer
    :initform 0))
)

(cl:defclass move_base (<move_base>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <move_base>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'move_base)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name omniwheel_control-msg:<move_base> is deprecated: use omniwheel_control-msg:move_base instead.")))

(cl:ensure-generic-function 'v_right-val :lambda-list '(m))
(cl:defmethod v_right-val ((m <move_base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:v_right-val is deprecated.  Use omniwheel_control-msg:v_right instead.")
  (v_right m))

(cl:ensure-generic-function 'v_left-val :lambda-list '(m))
(cl:defmethod v_left-val ((m <move_base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:v_left-val is deprecated.  Use omniwheel_control-msg:v_left instead.")
  (v_left m))

(cl:ensure-generic-function 'v_back-val :lambda-list '(m))
(cl:defmethod v_back-val ((m <move_base>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:v_back-val is deprecated.  Use omniwheel_control-msg:v_back instead.")
  (v_back m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <move_base>) ostream)
  "Serializes a message object of type '<move_base>"
  (cl:let* ((signed (cl:slot-value msg 'v_right)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'v_left)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'v_back)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <move_base>) istream)
  "Deserializes a message object of type '<move_base>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'v_right) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'v_left) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'v_back) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<move_base>)))
  "Returns string type for a message object of type '<move_base>"
  "omniwheel_control/move_base")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'move_base)))
  "Returns string type for a message object of type 'move_base"
  "omniwheel_control/move_base")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<move_base>)))
  "Returns md5sum for a message object of type '<move_base>"
  "e7eb46e0f2c9f6ac4de66b4a1727ce26")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'move_base)))
  "Returns md5sum for a message object of type 'move_base"
  "e7eb46e0f2c9f6ac4de66b4a1727ce26")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<move_base>)))
  "Returns full string definition for message of type '<move_base>"
  (cl:format cl:nil "int64 v_right~%int64 v_left~%int64 v_back~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'move_base)))
  "Returns full string definition for message of type 'move_base"
  (cl:format cl:nil "int64 v_right~%int64 v_left~%int64 v_back~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <move_base>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <move_base>))
  "Converts a ROS message object to a list"
  (cl:list 'move_base
    (cl:cons ':v_right (v_right msg))
    (cl:cons ':v_left (v_left msg))
    (cl:cons ':v_back (v_back msg))
))
