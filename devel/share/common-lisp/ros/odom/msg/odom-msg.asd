
(cl:in-package :asdf)

(defsystem "odom-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "rpm" :depends-on ("_package_rpm"))
    (:file "_package_rpm" :depends-on ("_package"))
  ))