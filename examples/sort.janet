```
(defn sort
  ``
  Sorts `x` in-place, and returns it. Uses quick-sort and is not a
  stable sort. If a `before?` comparator function is provided, sorts
  elements using that, otherwise uses `<`.

  `x` can be a buffer, array, or abstract type with suitable `get`,
  `put`, and `length` methods.
  ``
  [x &opt before?]
  (default before? <)
  (sort-help x 0 (- (length x) 1) before?))
```

(comment

  (def buf @"zyx")

  (sort buf)
  # =>
  @"xyz"

  buf
  # =>
  @"xyz"

  (sort buf >)
  # =>
  @"zyx"

  buf
  # =>
  @"zyx"

  )

(comment

  (def arr @[2 1 0])

  (sort arr)
  # =>
  @[0 1 2]

  arr
  # =>
  @[0 1 2]

  (sort arr >)
  # =>
  @[2 1 0]

  arr
  # =>
  @[2 1 0]

  )

