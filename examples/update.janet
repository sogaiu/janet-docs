```
(defn update
  ``
  For a given key in `x`, replace its associated value with the result
  of applying `f` to that value. If `args` are provided, they will be
  passed along to `func` as well. Returns updated `x`.

  `x` can be a buffer, array, table, or suitable abstract type with
  `get` and `put` methods.
  ``
  [x key f & args]
  (def old (get x key))
  (put x key (f old ;args)))
```

(comment

  (update @"hello" 0 (fn [old delta] (+ old delta)) 17)
  # =>
  @"yello"

  )

(comment

  (update @[:x :yy :z] 1 |(keyword (slice $ 0 1)))
  # =>
  @[:x :y :z]

  )

(comment

  (update @{:a 1 :b -1 :c 3} :b + 3)
  # =>
  @{:a 1 :b 2 :c 3}

  )

