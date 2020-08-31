
(cl:in-package :asdf)

(defsystem "omniwheel_keyboard_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "move_base" :depends-on ("_package_move_base"))
    (:file "_package_move_base" :depends-on ("_package"))
    (:file "num" :depends-on ("_package_num"))
    (:file "_package_num" :depends-on ("_package"))
  ))