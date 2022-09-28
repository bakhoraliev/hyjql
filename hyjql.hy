(defn first [coll]
  "Returns the first item in the collection. Calls list on its
  argument."
  (get (list coll) 0))


(defn rest [coll]
  "Returns a possibly empty seq of the items after the first. Calls seq on its
  argument."
  (let [seq (list coll)]
    (get seq (slice 1 (len seq)))))


(defn format [data]
  "Turn the data DSL into a vector containing a JQL string followed by
  any parameter values that were encountered in the DSL structure."
  ...)
