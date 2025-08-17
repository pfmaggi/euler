(defn mod-three-or-five?
 "Return true if number can be divided by three or five."
 [number]
 (if (= (% number 3) 0) 
    true
    (if (= (% number 5) 0)
        true
        false)))

(var sum 0)
(loop [i :range [0 1000] :when (mod-three-or-five? i)] (+= sum i))
(print "Problem 0001: Sum of multiples of 3 and 5 below 1000 is: " sum)
