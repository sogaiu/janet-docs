```
(defmacro eachk
  ``
  Loop over each key in `x` with each key bound to `binding` with
  destructuring support. Returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with a suitable `next` method.
  ``
  [binding x & body]
  (each-template binding x :keys body))
```
