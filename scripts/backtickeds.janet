(import ./common :as c)

(defn main
  [_ & _args]
  (def bts @{})
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    (def body-lines (get p :body))
    (def body (c/lines-as-string body-lines))
    #
    (def hits (c/find-code-spans body))
    (when hits
      (each elt hits
        (when (not (get bts elt))
          (def which (c/classify elt))
          (put bts elt which)))))
  #
  (each elt (sort (keys bts))
    (printf "%s - %j" elt (get bts elt))))

