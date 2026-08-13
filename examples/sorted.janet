```
(defn sorted
  ``
  Returns a new sorted array based on an indexed type `ind`. If a
  `before?` comparator function is provided, sorts elements using
  that, otherwise uses `<`.
  ``
  [ind &opt before?]
  (sort (array/slice ind) before?))
```

(comment

  (sorted [:z :y :x])
  # =>
  @[:x :y :z]

  (sorted @[8 5 3 2 1 1])
  # =>
  @[1 1 2 3 5 8]

  (sorted @[3 1 4 1 5 9 2] >)
  # =>
  @[9 5 4 3 2 1 1]

  )

