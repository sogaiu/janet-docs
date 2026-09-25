# XXX: extra points for looking up "refrred to" constructs and
#      checking if their docstrings mention the parameters even if the
#      original docstring doesn't.  e.g. `string/slice` mentions its
#      parameters but `symbol/slice` does not; `symbol/slice`'s
#      docstring does reference `string/slice` though.  this may be
#      rather hard to do reliably unless the referencing is formulaic
#      enough.

(import ./common :as c)

(defn main
  [_ & _args]
  (def ignore (invert ['& '&opt '&named]))
  (each name (all-bindings root-env)
    (def p (c/parse-ds (c/get-ds (string name))))
    (when-let [sig-str (get p :sig)]
      (def syms (->> (array/slice (parse sig-str) 1)
                     flatten # `with` has destructuring signature
                     (filter |(not (get ignore $)))))
      (when (not (empty? syms))
        (def body-lines (get p :body))
        (def body (c/lines-as-string body-lines))
        #
        (when-let [hits (c/find-code-spans body)]
          (def unique-hits (distinct hits))
          (each s syms
            (when (not (index-of (string s) unique-hits))
              (printf "%s: missing %s parameter in docstring" name s))))))))

