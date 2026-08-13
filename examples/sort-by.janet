```
(defn sort-by
  ``
  Sorts `x` in-place by calling a function `f` on each element and
  comparing the result with `<`.

  `x` can be a buffer, array, or abstract type with suitable `get`,
  `put`, and `length` methods.
  ``
  [f x]
  (sort x (fn :sort-by-comp [i j] (< (f i) (f j)))))
```

(comment

  (def buf @"zyx")

  (sort-by |(* $ $) buf)
  # =>
  @"xyz"

  buf
  # =>
  @"xyz"

  )

(comment

  (def arr @[-2 -1 -0])

  (sort-by math/abs arr)
  # =>
  @[0 -1 -2]

  arr
  # =>
  @[0 -1 -2]

  )

