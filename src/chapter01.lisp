(in-package :paip-solutions)

(defparameter *titles*
  '(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
  "A list of titles that can appear at the start of a name.")

(defparameter *suffixes*
  '(Jr. Sr. MD Phd BA)
  "A list of name suffixes that can appear at the end of a name.")

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (if (member (first name) *titles*)
      (first-name (rest name))
      (first name)))

;; Exercise 1.1
(defun last-name (name)
  "Select the last name from a name represented as a list."
  (let ((lname  (first (last name))))
    (if (member lname *suffixes*)
        (last-name (reverse (rest (reverse name))))
        lname)))

;; Exercise 1.2
(defun exponent (base power)
  (if (= power 0)
      1
      (loop for i from 1 to power
            for result = base then (* result base)
            finally (return result))))

(defun power (x n)
  "Power raises x to the nth power. N must be an integer >= 0.
This executes in log n time, because of the check for even n."
  (cond (( = n 0) 1)
        ((evenp n) (expt (power x (/ n 2)) 2))
        (t (* x (power x ( - n 1))))))
