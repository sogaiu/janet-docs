(import ./common :as c)

(defn main
  [_ & _args]
  (def params @{})
  (each sym (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string sym))))
    (when-let [sig-str (get p :sig)]
      (def syms (c/parse-sig sig-str))
      (each s syms
        (if (not (get params s))
          (put params s @[sym])
          (array/push (get params s) sym))
        (when (get root-env s)
          (printf "%s: %s" sym s))))))

