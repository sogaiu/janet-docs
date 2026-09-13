(import ./common :as c)

(defn main
  [_ & _args]
  (var tot 0)
  (def params @{})
  (each sym (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string sym))))
    # XXX: work-around
    (when (= sym 'tuple/slice)
      (put p :sig "(tuple/slice arrtup &opt start end)"))
    (when-let [sig-str (get p :sig)]
      (++ tot)
      (printf "%s" sig-str)))
  #(print)
  #(printf "total: %d" tot)
  )

