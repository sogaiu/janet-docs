```
(defn filter
  ``
  Given a predicate, take only elements from `x` for which `(pred
  element)` is truthy. Returns a new array.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [pred x]
  (def res @[])
  (each v x
    (if (pred v) (array/push res v)))
  res)
```

(comment

  (filter |(< $ (chr "m")) "azbycw")
  # =>
  @[97 98 99]

  )

(comment

  (filter pos? @[-1 0 1])
  # =>
  @[1]

  )

(comment

  (sort (filter int? {:a 1 :b 2.3 :c 3}))
  # =>
  @[1 3]

  )

(comment

  (filter even? (coro (yield 1) (yield 2) (yield 8)))
  # =>
  @[2 8]

  )

