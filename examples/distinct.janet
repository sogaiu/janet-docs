```
(defn distinct
  ``
  Returns an array of the deduplicated values of `x`.

  `x` can be a bytes, index, dictionary, fiber, or abstract type with
  suitable `get` and `next` methods.
  ``
  [x]
  (def ret @[])
  (def seen @{})
  (each v x
    (unless (in seen v) (put seen v true) (array/push ret v)))
  ret)
```

(comment

  (distinct :hello)
  # =>
  @[104 101 108 111]

  )

(comment

  (distinct [1 0 1 0 1 1 0 1 1 1])
  # =>
  @[1 0]

  )

(comment

  (distinct @{0 :a 1 :b 2 :b 3 :a})
  # =>
  @[:a :b]

  )

(comment

  (distinct (coro (yield 8) (yield 11) (yield 8)))
  # =>
  @[8 11]

  )

