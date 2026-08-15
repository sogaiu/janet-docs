```
(defn sum
  ``
  Returns the sum of the values of `x`. If `x` is empty, returns 0.

 `x` can be a bytes, indexed, dictionary, fiber, or abstract type with
  suitable `get` and `next` methods.
  ``
  [x]
  (var accum 0)
  (each v x (+= accum v))
  accum)
```

(comment

  (sum "zzooodd")
  # =>
  777

  (sum @"")
  # =>
  0

  )

(comment

  (sum @[2 3 5 7 11 13 17 19])
  # =>
  77

  )

(comment

  (sum {:one 1 :two 2 :three 3})
  # =>
  6

  )

(comment

  (sum (coro (yield 1) (yield 2) (yield 3)))
  # =>
  6

  )

