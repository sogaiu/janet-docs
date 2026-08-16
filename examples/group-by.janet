```
(defn group-by
  ``
  Group values of `x` by a function `f` and put the results into a new
  table. The keys of the table are the distinct return values from
  calling `f` on the values of `x`. The values of the table are arrays
  of all values of `x` for which `f` called on the value equals that
  corresponding key.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [f x]
  (def ret @{})
  (each v x
    (def y (f v))
    (if-let [arr (get ret y)]
      (array/push arr v)
      (put ret y @[v])))
  ret)
```

(comment

  (group-by |(< $ (chr "m")) "abcxyz")
  # =>
  @{false @[120 121 122] true @[97 98 99]}

  )

(comment

  (group-by identity [0 1 2])
  # =>
  @{0 @[0] 1 @[1] 2 @[2]}

  )

(comment

  (group-by type {:a 97 :b 98 :y true :z false})
  # =>
  @{:boolean @[false true] :number @[98 97]}

  )

(comment

  (group-by zero? (coro (yield 0) (yield 11)))
  # =>
  @{false @[11] true @[0]}

  )

