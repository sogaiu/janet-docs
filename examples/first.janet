```
(defn first
  ``
  Get the first value in `x`.

  If `x` is a non-empty bytes or indexed type value, return the first
  element.

  If `x` is a fiber, return the fiber's last value or `nil` if there
  isn't one yet.

  If `x` is an abstract type value with a `get` method, call the method
  with a key of `0`.

  In all other cases, return `nil`.
  ``
  [x]
  (get x 0))
```

(comment

  (first "ABC")
  # =>
  65

  (first [:ant :bee])
  # =>
  :ant

  )

(comment

  (def fib (coro (yield :a)))

  (first fib)
  # =>
  nil

  (resume fib)

  (first fib)
  # =>
  :a

  )

(comment

  (first {:a 1})
  # =>
  nil

  (first math/pi)
  # =>
  nil

  (first true)
  # =>
  nil

  (first nil)
  # =>
  nil

  )

