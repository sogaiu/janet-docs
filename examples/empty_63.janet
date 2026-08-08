```
(defn empty?
  ``
  Check if `x` is empty.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with a `next` method.
  ``
  [x]
  (= nil (next x nil)))
```

(comment

  (empty? "")
  # =>
  true

  )

(comment

  (empty? [])
  # =>
  true

  (empty? [1])
  # =>
  false

  (empty? @[])
  # =>
  true

  )

(comment

  (empty? @{})
  # =>
  true

  )

(comment

  # errors since 0 is a number
  (protect
    (empty? 0))

  )

