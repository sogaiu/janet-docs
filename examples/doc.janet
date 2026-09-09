```
(defmacro doc
  ``
  Shows documentation for `what` or lists binding names. If `what` is
  a symbol, shows documentation for that symbol. If `what` is a
  string, shows all lexical and dynamic binding names in the current
  environment containing the string. If `what` is not provided, shows
  all binding names.
  ``
  [&opt what]
  ~(,doc* ',what))
```
