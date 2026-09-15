(defn main
  [_ & args]
  (def target (get args 0))
  (def hits @{})
  (each sym (all-bindings root-env)
    (def ds (get-in root-env [sym :doc]))
    (when ds
      (when (string/find target ds)
        (put hits sym true))))
  (each sym (sort (keys hits))
    (print sym)))

