; Auto-generated. Do not edit!


(cl:in-package omniwheel_control-msg)


;//! \htmlinclude wheels_trans.msg.html

(cl:defclass <wheels_trans> (roslisp-msg-protocol:ros-message)
  ((wID
    :reader wID
    :initarg :wID
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (wcenterx
    :reader wcenterx
    :initarg :wcenterx
    :type cl:integer
    :initform 0)
   (wcentery
    :reader wcentery
    :initarg :wcentery
    :type cl:integer
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass wheels_trans (<wheels_trans>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <wheels_trans>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'wheels_trans)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name omniwheel_control-msg:<wheels_trans> is deprecated: use omniwheel_control-msg:wheels_trans instead.")))

(cl:ensure-generic-function 'wID-val :lambda-list '(m))
(cl:defmethod wID-val ((m <wheels_trans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:wID-val is deprecated.  Use omniwheel_control-msg:wID instead.")
  (wID m))

(cl:ensure-generic-function 'wcenterx-val :lambda-list '(m))
(cl:defmethod wcenterx-val ((m <wheels_trans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:wcenterx-val is deprecated.  Use omniwheel_control-msg:wcenterx instead.")
  (wcenterx m))

(cl:ensure-generic-function 'wcentery-val :lambda-list '(m))
(cl:defmethod wcentery-val ((m <wheels_trans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:wcentery-val is deprecated.  Use omniwheel_control-msg:wcentery instead.")
  (wcentery m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <wheels_trans>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader omniwheel_control-msg:angle-val is deprecated.  Use omniwheel_control-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <wheels_trans>) ostream)
  "Serializes a message object of type '<wheels_trans>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'wID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'wID))
  (cl:let* ((signed (cl:slot-value msg 'wcenterx)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'wcentery)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <wheels_trans>) istream)
  "Deserializes a message object of type '<wheels_trans>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'wID) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'wID)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wcenterx) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'wcentery) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<wheels_trans>)))
  "Returns string type for a message object of type '<wheels_trans>"
  "omniwheel_control/wheels_trans")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'wheels_trans)))
  "Returns string type for a message object of type 'wheels_trans"
  "omniwheel_control/wheels_trans")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<wheels_trans>)))
  "Returns md5sum for a message object of type '<wheels_trans>"
  "c432407a8349c63fa0f07653bd392f4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'wheels_trans)))
  "Returns md5sum for a message object of type 'wheels_trans"
  "c432407a8349c63fa0f07653bd392f4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<wheels_trans>)))
  "Returns full string definition for message of type '<wheels_trans>"
  (cl:format cl:nil "int32[] wID~%int32 wcenterx~%int32 wcentery~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'wheels_trans)))
  "Returns full string definition for message of type 'wheels_trans"
  (cl:format cl:nil "int32[] wID~%int32 wcenterx~%int32 wcentery~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <wheels_trans>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'wID) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <wheels_trans>))
  "Converts a ROS message object to a list"
  (cl:list 'wheels_trans
    (cl:cons ':wID (wID msg))
    (cl:cons ':wcenterx (wcenterx msg))
    (cl:cons ':wcentery (wcentery msg))
    (cl:cons ':angle (angle msg))
))
