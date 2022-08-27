;;; Project Euler - Problem 1

;; If we list all the natural numbers below 10 that are multiples of 3
;; or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

;; Find the sum of all the multiples of 3 or 5 below 1000.

(defun multiples-of-three-and-five (n)
  (let ((sum 0))
    (dotimes (i n)
      (cond ((eq 0 (rem i 3)) (setf sum (+ sum i)))
	    ((eq 0 (rem i 5)) (setf sum (+ sum i)))))
    (princ sum))
  )

(defun euler-1 ()
  (multiples-of-three-and-five 1000))
