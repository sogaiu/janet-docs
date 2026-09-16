(import ./common :as c)

(defn main
  [_ & _args]
  (def types @{})
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    (def body-lines (get p :body))
    (def body (c/lines-as-string body-lines))
    #
    (def hits (c/find-code-spans body))
    (when hits
      (each elt hits
        (def which (c/classify elt))
        (if-let [elts (get types which)]
          (array/push elts elt)
          (put types which @[elt])))))
  #
  (each _type (sort (keys types))
    (printf "%s" _type)
    # use distinct if just want unique things
    (each elt (sort (get types _type))
      (printf "  %s" elt))))

