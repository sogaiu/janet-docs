```
(defn product
  ``
  Returns the product of the values of `x`. If `x` is empty, returns
  1.

 `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (var accum 1)
  (each v x (*= accum v))
  accum)
```

(comment

  (product "\ao")
  # =>
  777

  (product @"")
  # =>
  1

  )

(comment

  (product @[2 3 5 7 11 13 17 19])
  # =>
  9699690

  )

(comment

  (product {:one 1 :two 2 :three 3})
  # =>
  6

  )

(comment

  (product (coro (yield 1) (yield 2) (yield 3)))
  # =>
  6

  )

