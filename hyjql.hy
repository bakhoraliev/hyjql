(import itertools [chain])
(import functools [reduce])

(setv __version__ "0.1.0")

(defn first [coll]
  "Returns the first item in the collection. Calls list on its
  argument."
  (get (list coll) 0))

(defn second [coll]
  "Returns the second item in the collection. Calls list on its
  argument."
  (get (list coll) 1))

(defn rest [coll]
  "Returns a possibly empty seq of the items after the first. Calls list on its
  argument."
  (let [seq (list coll)]
    (get seq (slice 1 (len seq)))))

(setv operators-map {:equals "="        :not-equals "!="
                     :greater-than ">"  :greater-than-equals ">="
                     :less-than "<"     :less-than-equals "<="
                     :in "IN"           :not-in "NOT IN"
                     :contains "~"      :not-contains "!~"
                     :is "IS"           :is-not "IS NOT"
                     :was "WAS"         :was-not "WAS NOT"
                     :was-in "WAS IN"   :was-not-in "WAS NOT IN"
                     :changed "CHANGED"})

(defn format-predicates [predicates]
  "Formats a list of predicates into a string suitable for clause."
  (.join " " (map str (reduce chain [] predicates))))

(defn format [data]
  "Turn the data DSL into a vector containing a JQL string followed by
  any parameter values that were encountered in the DSL structure."
  (let [struct (.items data)
        clause (first struct)
        predicates (rest struct)
        operator (first clause)
        operands (second clause)
        left (first operands)
        right (second operands)]
    f"{left} {(get operators-map operator)} {right} {(format-predicates predicates)}"))
