```
(defmacro eachp
  ``
  Loop over each (key, value) pair in `x` with each pair bound to
  `binding` with destructuring support. Returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [binding x & body]
  (each-template binding x :pairs body))
```
