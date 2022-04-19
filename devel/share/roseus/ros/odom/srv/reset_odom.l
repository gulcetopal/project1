;; Auto-generated. Do not edit!


(when (boundp 'odom::reset_odom)
  (if (not (find-package "ODOM"))
    (make-package "ODOM"))
  (shadow 'reset_odom (find-package "ODOM")))
(unless (find-package "ODOM::RESET_ODOM")
  (make-package "ODOM::RESET_ODOM"))
(unless (find-package "ODOM::RESET_ODOMREQUEST")
  (make-package "ODOM::RESET_ODOMREQUEST"))
(unless (find-package "ODOM::RESET_ODOMRESPONSE")
  (make-package "ODOM::RESET_ODOMRESPONSE"))

(in-package "ROS")





(defclass odom::reset_odomRequest
  :super ros::object
  :slots (_new_x _new_y _new_yaw ))

(defmethod odom::reset_odomRequest
  (:init
   (&key
    ((:new_x __new_x) 0.0)
    ((:new_y __new_y) 0.0)
    ((:new_yaw __new_yaw) 0.0)
    )
   (send-super :init)
   (setq _new_x (float __new_x))
   (setq _new_y (float __new_y))
   (setq _new_yaw (float __new_yaw))
   self)
  (:new_x
   (&optional __new_x)
   (if __new_x (setq _new_x __new_x)) _new_x)
  (:new_y
   (&optional __new_y)
   (if __new_y (setq _new_y __new_y)) _new_y)
  (:new_yaw
   (&optional __new_yaw)
   (if __new_yaw (setq _new_yaw __new_yaw)) _new_yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _new_x
    8
    ;; float64 _new_y
    8
    ;; float64 _new_yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _new_x
       (sys::poke _new_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _new_y
       (sys::poke _new_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _new_yaw
       (sys::poke _new_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _new_x
     (setq _new_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _new_y
     (setq _new_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _new_yaw
     (setq _new_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass odom::reset_odomResponse
  :super ros::object
  :slots (_old_x _old_y _old_yaw ))

(defmethod odom::reset_odomResponse
  (:init
   (&key
    ((:old_x __old_x) 0.0)
    ((:old_y __old_y) 0.0)
    ((:old_yaw __old_yaw) 0.0)
    )
   (send-super :init)
   (setq _old_x (float __old_x))
   (setq _old_y (float __old_y))
   (setq _old_yaw (float __old_yaw))
   self)
  (:old_x
   (&optional __old_x)
   (if __old_x (setq _old_x __old_x)) _old_x)
  (:old_y
   (&optional __old_y)
   (if __old_y (setq _old_y __old_y)) _old_y)
  (:old_yaw
   (&optional __old_yaw)
   (if __old_yaw (setq _old_yaw __old_yaw)) _old_yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _old_x
    8
    ;; float64 _old_y
    8
    ;; float64 _old_yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _old_x
       (sys::poke _old_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _old_y
       (sys::poke _old_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _old_yaw
       (sys::poke _old_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _old_x
     (setq _old_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _old_y
     (setq _old_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _old_yaw
     (setq _old_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass odom::reset_odom
  :super ros::object
  :slots ())

(setf (get odom::reset_odom :md5sum-) "67113a69c2a17203e20c1586e4277dc3")
(setf (get odom::reset_odom :datatype-) "odom/reset_odom")
(setf (get odom::reset_odom :request) odom::reset_odomRequest)
(setf (get odom::reset_odom :response) odom::reset_odomResponse)

(defmethod odom::reset_odomRequest
  (:response () (instance odom::reset_odomResponse :init)))

(setf (get odom::reset_odomRequest :md5sum-) "67113a69c2a17203e20c1586e4277dc3")
(setf (get odom::reset_odomRequest :datatype-) "odom/reset_odomRequest")
(setf (get odom::reset_odomRequest :definition-)
      "float64 new_x
float64 new_y
float64 new_yaw
---
float64 old_x
float64 old_y
float64 old_yaw
")

(setf (get odom::reset_odomResponse :md5sum-) "67113a69c2a17203e20c1586e4277dc3")
(setf (get odom::reset_odomResponse :datatype-) "odom/reset_odomResponse")
(setf (get odom::reset_odomResponse :definition-)
      "float64 new_x
float64 new_y
float64 new_yaw
---
float64 old_x
float64 old_y
float64 old_yaw
")



(provide :odom/reset_odom "67113a69c2a17203e20c1586e4277dc3")


