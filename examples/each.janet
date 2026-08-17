```
(defmacro each
  ``
  Loop over each value in `x` with each value of `x` bound to
  `binding` with destructuring support. Returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [binding x & body]
  (each-template binding x :each body))
```
