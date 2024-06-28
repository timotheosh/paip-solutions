(defsystem "paip-solutions"
  :version "0.1.0"
  :author "Tim Hawes <trhawes@gmail.com>"
  :license "MIT"
  :depends-on ("cl-ppcre"
               "unix-opts")
  :components ((:module "src"
                :components
                ((:file "main")
                 (:file "chapter01"))))
  :description "Solutions of exercises in Paradigms of Artificial Intelligence"
  :build-operation "asdf:program-op"
  :build-pathname "target/paip-solutions"
  :entry-point "paip-solutions:-main"
  :in-order-to ((test-op (test-op "paip-solutions/tests"))))

(defsystem "paip-solutions/tests"
  :author "Tim Hawes <trhawes@gmail.com>"
  :license "MIT"
  :depends-on ("paip-solutions"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for paip-solutions"
  :perform (test-op (op c) (symbol-call :fiveam :run! (find-symbol* :all-tests :paip-solutions/tests))))
