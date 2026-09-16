(import ./common :as c)

(defn main
  [_ & _args]
  (def params @{})
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    # XXX: work-around
    (when (= name 'tuple/slice)
      (put p :sig "(tuple/slice arrtup &opt start end)"))
    (when-let [sig-str (get p :sig)]
      (def names (c/parse-sig sig-str))
      (each nm names
        (if (not (get params nm))
          (put params nm @[name])
          (array/push (get params nm) name)))))
  (each p (sort (keys params))
    (printf "%s: %s" p (string/join (get params p) ", "))))

