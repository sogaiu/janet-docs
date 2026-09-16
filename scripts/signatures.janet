(import ./common :as c)

(defn main
  [_ & _args]
  (var tot 0)
  (def params @{})
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    # XXX: work-around
    (when (= name 'tuple/slice)
      (put p :sig "(tuple/slice arrtup &opt start end)"))
    (when-let [sig-str (get p :sig)]
      (++ tot)
      (printf "%s" sig-str)))
  #(print)
  #(printf "total: %d" tot)
  )

