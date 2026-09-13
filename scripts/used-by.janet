(import ./common :as c)

(defn main
  [_ & _args]
  (def params @{})
  (each sym (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string sym))))
    # XXX: work-around
    (when (= sym 'tuple/slice)
      (put p :sig "(tuple/slice arrtup &opt start end)"))
    (when-let [sig-str (get p :sig)]
      (def syms (c/parse-sig sig-str))
      (each s syms
        (if (not (get params s))
          (put params s @[sym])
          (array/push (get params s) sym)))
      (printf "%s: %s" sym sig-str)))
  (each p (sort (keys params))
    (printf "%s: %s" p (string/join (get params p) ", "))))

