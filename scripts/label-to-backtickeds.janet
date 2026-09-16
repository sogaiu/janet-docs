(import ./common :as c)

(defn main
  [_ & _args]
  (def types @{})
  (def bts @{})
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    (def body-lines (get p :body))
    #
    (def indent
      (let [_line (get body-lines 0)]
        (- (length _line) (length (string/triml _line)))))
    # dedent all body lines and stitch together
    (def body
      (-> (map |(if (< 0 (length $)) (string/slice $ indent) $)
               body-lines)
          # XXX: not the same as the original since no newlines
          (string/join " ")))
    (def hits
      (peg/match ~(some (sequence (to "`")
                                  (sequence "`" (capture (to "`")) "`")))
                 body))
    (when hits
      (each elt hits
        (when (not (get bts elt))
          (def which (c/classify elt))
          (put bts elt which)
          (if-let [elts (get types which)]
            (array/push elts elt)
            (put types which @[elt]))))))
  #
  (each _type (sort (keys types))
    (printf "%s" _type)
    (each elt (sort (get types _type))
      (printf "  %s" elt))))

