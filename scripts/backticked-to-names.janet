(import ./common :as c)

(defn main
  [_ & _args]
  (def seen @{})
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
        (if (get seen elt)
          (array/push (get seen elt) name)
          (put seen elt @[name])))))
  #
  (each elt (sort (keys seen))
    (def names (if-let [_names (get seen elt)]
                 (tabseq [nm :in _names] nm true)
                 @{}))
    (printf "%s - %j" elt (sort (keys names)))))

