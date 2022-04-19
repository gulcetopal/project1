
(cl:in-package :asdf)

(defsystem "odom-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "reset_odom" :depends-on ("_package_reset_odom"))
    (:file "_package_reset_odom" :depends-on ("_package"))
  ))