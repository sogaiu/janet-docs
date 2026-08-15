```
(defn reverse!
  ``
  Reverses the order of the values in `x` and returns it mutated.

  `x` can be a buffer, array, or abstract type with suitable
  `get`, `length`, and `put` methods.
  ``
  [x]
  (var i 0)
  (var j (length x))
  (while (< i (-- j))
    (def v (in x i))
    (put x i (in x j))
    (put x j v)
    (++ i))
  x)
```

(comment

  (def buf @"ahola")

  (reverse! buf)
  # =>
  @"aloha"

  buf
  # =>
  @"aloha"

  )

(comment

  (def arr @[2 3 5 7])

  (reverse! arr)
  # =>
  @[7 5 3 2]

  arr
  # =>
  @[7 5 3 2]

  )

# XXX: questionable utility
(comment

  (reverse {:a 1 :b 2})
  # =>
  @[1 2]

  )

