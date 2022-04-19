; Auto-generated. Do not edit!


(cl:in-package odom-srv)


;//! \htmlinclude reset_odom-request.msg.html

(cl:defclass <reset_odom-request> (roslisp-msg-protocol:ros-message)
  ((new_x
    :reader new_x
    :initarg :new_x
    :type cl:float
    :initform 0.0)
   (new_y
    :reader new_y
    :initarg :new_y
    :type cl:float
    :initform 0.0)
   (new_yaw
    :reader new_yaw
    :initarg :new_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass reset_odom-request (<reset_odom-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset_odom-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset_odom-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name odom-srv:<reset_odom-request> is deprecated: use odom-srv:reset_odom-request instead.")))

(cl:ensure-generic-function 'new_x-val :lambda-list '(m))
(cl:defmethod new_x-val ((m <reset_odom-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:new_x-val is deprecated.  Use odom-srv:new_x instead.")
  (new_x m))

(cl:ensure-generic-function 'new_y-val :lambda-list '(m))
(cl:defmethod new_y-val ((m <reset_odom-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:new_y-val is deprecated.  Use odom-srv:new_y instead.")
  (new_y m))

(cl:ensure-generic-function 'new_yaw-val :lambda-list '(m))
(cl:defmethod new_yaw-val ((m <reset_odom-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:new_yaw-val is deprecated.  Use odom-srv:new_yaw instead.")
  (new_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset_odom-request>) ostream)
  "Serializes a message object of type '<reset_odom-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'new_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'new_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'new_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset_odom-request>) istream)
  "Deserializes a message object of type '<reset_odom-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'new_yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset_odom-request>)))
  "Returns string type for a service object of type '<reset_odom-request>"
  "odom/reset_odomRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_odom-request)))
  "Returns string type for a service object of type 'reset_odom-request"
  "odom/reset_odomRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset_odom-request>)))
  "Returns md5sum for a message object of type '<reset_odom-request>"
  "67113a69c2a17203e20c1586e4277dc3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset_odom-request)))
  "Returns md5sum for a message object of type 'reset_odom-request"
  "67113a69c2a17203e20c1586e4277dc3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset_odom-request>)))
  "Returns full string definition for message of type '<reset_odom-request>"
  (cl:format cl:nil "float64 new_x~%float64 new_y~%float64 new_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset_odom-request)))
  "Returns full string definition for message of type 'reset_odom-request"
  (cl:format cl:nil "float64 new_x~%float64 new_y~%float64 new_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset_odom-request>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset_odom-request>))
  "Converts a ROS message object to a list"
  (cl:list 'reset_odom-request
    (cl:cons ':new_x (new_x msg))
    (cl:cons ':new_y (new_y msg))
    (cl:cons ':new_yaw (new_yaw msg))
))
;//! \htmlinclude reset_odom-response.msg.html

(cl:defclass <reset_odom-response> (roslisp-msg-protocol:ros-message)
  ((old_x
    :reader old_x
    :initarg :old_x
    :type cl:float
    :initform 0.0)
   (old_y
    :reader old_y
    :initarg :old_y
    :type cl:float
    :initform 0.0)
   (old_yaw
    :reader old_yaw
    :initarg :old_yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass reset_odom-response (<reset_odom-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset_odom-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset_odom-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name odom-srv:<reset_odom-response> is deprecated: use odom-srv:reset_odom-response instead.")))

(cl:ensure-generic-function 'old_x-val :lambda-list '(m))
(cl:defmethod old_x-val ((m <reset_odom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:old_x-val is deprecated.  Use odom-srv:old_x instead.")
  (old_x m))

(cl:ensure-generic-function 'old_y-val :lambda-list '(m))
(cl:defmethod old_y-val ((m <reset_odom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:old_y-val is deprecated.  Use odom-srv:old_y instead.")
  (old_y m))

(cl:ensure-generic-function 'old_yaw-val :lambda-list '(m))
(cl:defmethod old_yaw-val ((m <reset_odom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader odom-srv:old_yaw-val is deprecated.  Use odom-srv:old_yaw instead.")
  (old_yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset_odom-response>) ostream)
  "Serializes a message object of type '<reset_odom-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'old_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'old_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'old_yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset_odom-response>) istream)
  "Deserializes a message object of type '<reset_odom-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'old_yaw) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset_odom-response>)))
  "Returns string type for a service object of type '<reset_odom-response>"
  "odom/reset_odomResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_odom-response)))
  "Returns string type for a service object of type 'reset_odom-response"
  "odom/reset_odomResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset_odom-response>)))
  "Returns md5sum for a message object of type '<reset_odom-response>"
  "67113a69c2a17203e20c1586e4277dc3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset_odom-response)))
  "Returns md5sum for a message object of type 'reset_odom-response"
  "67113a69c2a17203e20c1586e4277dc3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset_odom-response>)))
  "Returns full string definition for message of type '<reset_odom-response>"
  (cl:format cl:nil "float64 old_x~%float64 old_y~%float64 old_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset_odom-response)))
  "Returns full string definition for message of type 'reset_odom-response"
  (cl:format cl:nil "float64 old_x~%float64 old_y~%float64 old_yaw~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset_odom-response>))
  (cl:+ 0
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset_odom-response>))
  "Converts a ROS message object to a list"
  (cl:list 'reset_odom-response
    (cl:cons ':old_x (old_x msg))
    (cl:cons ':old_y (old_y msg))
    (cl:cons ':old_yaw (old_yaw msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'reset_odom)))
  'reset_odom-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'reset_odom)))
  'reset_odom-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_odom)))
  "Returns string type for a service object of type '<reset_odom>"
  "odom/reset_odom")