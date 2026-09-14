(import ./common :as c)

(defn main
  [_ & _args]
  (def seen @{})
  (each sym (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string sym))))
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
    (def m
      (peg/match ~(some (sequence (to "`")
                                  (sequence "`" (capture (to "`")) "`")))
                 body))
    (when m
      (each elt m
        (if (get seen elt)
          (array/push (get seen elt) sym)
          (put seen elt @[sym])))))
  #
  (each elt (sort (keys seen))
    (def names (if-let [_names (get seen elt)]
                 (tabseq [n :in _names] n true)
                 @{}))
    (printf "%s: %j" elt (sort (keys names)))))

