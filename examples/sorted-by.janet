```
(defn sorted-by
  ``
  Returns a new sorted array based on an indexed type `ind`.
  Comparison is done by invoking a function `f` on each element and
  comparing the results with `<`.
  ``
  [f ind]
  (sorted ind (fn :sorted-by-comp [x y] (< (f x) (f y)))))
```

(comment

  (sorted-by math/abs [-1 0 1])
  # =>
  @[0 1 -1]

  (sorted-by |(* $ $) @[-3 1 -4 1 -5 9 -2])
  # =>
  @[1 1 -2 -3 -4 -5 9]

  )

