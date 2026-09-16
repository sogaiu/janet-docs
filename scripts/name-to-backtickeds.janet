(import ./common :as c)

(defn main
  [_ & _args]
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
    (def m
      (peg/match ~(some (sequence (to "`")
                                  (sequence "`" (capture (to "`")) "`")))
                 body))
    #
    (def bts (if m
               (tabseq [k :in m] k true)
               @{}))
    #
    (printf "%s - %j" name (sort (keys bts)))))

