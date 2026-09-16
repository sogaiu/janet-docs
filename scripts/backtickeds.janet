# XXX: weed out or change docstring:
#
#      * things with <sym> like bits?
#      * ... within janet fragment: @[k v k v k v ...]
#
# XXX: what to do about core/channel, core/native, etc.?

(import ./common :as c)

(defn main
  [_ & _args]
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
          (put bts elt which)))))
  #
  (each elt (sort (keys bts))
    (printf "%s - %j" elt (get bts elt))))

