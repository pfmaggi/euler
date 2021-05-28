(defun sum-even-fibonacci-up-to (upper-limit)
  "Returns the sum of the even fibonacci numbers up-to the parameter"
  ;;  (let ((prev 1) (current 2) (sum 2))
    (let ((prev 1) (current 1) (sum 0))
    (loop
      (let ((next (+ prev current)))
	    (when (> next upper-limit)
	      (return))
	    (setf prev current)
	    (setf current next)
	    (if (evenp current) (setf sum (+ sum current)))
	    ))
	(princ sum))
  )
;; (defun fibonacci (N)
;;     "Compute for the Nth Fibonacci Number."
;;     (if (or (zerop N) (= N 1))
;;         1
;;         (let
;;             ((F1 (fibonacci (- N 1)))
;;              (F2 (fibonacci (- N 2))))
;;           (+ F1 F2))))
;; (defun fibonacci-seq (n)
;;   "Compute the sequence up to the Nth Fibonacci number"
;;     (cond
;; 	   ((= n '0) `(1))
;; 	   ((= n '1) (append (fibonacci-seq 0) '(1)))
;; 	   ((> n '1) (let
;; 			 ((F1 (fibonacci-seq (- n 1))))
;; 		       (append F1 (list
;; 				   (loop for i from (- (length F1) 2) to (- (length F1) 1)
;; 					 sum (nth i F1) into total
;; 					 finally (return total))
;; 				   )))
;; 	    )
;; 	   )
;;   )

