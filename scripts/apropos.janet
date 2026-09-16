(defn main
  [_ & args]
  (def target (get args 0))
  (def hits @{})
  (each name (all-bindings root-env)
    (def ds (get-in root-env [name :doc]))
    (when ds
      (when (string/find target ds)
        (put hits name true))))
  (each name (sort (keys hits))
    (print name)))

