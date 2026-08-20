```
(defn interleave
  ``
  Returns an array of the values of each element of `xs`, interleaved.
  If the elements of `xs` do not all have the same number of values,
  the shortest element of `xs` determines the number of values from
  each element of `xs` that are contained in the returned array.

  Each element of `xs` can be a bytes, indexed, fiber, or abstract
  type with suitable `get` and `next` methods.
  ``
  [& xs]
  (mapcat tuple ;xs))
```

(comment

  (interleave "abc" "ijk" "xyz")
  # =>
  @[97 105 120 98 106 121 99 107 122]

  (interleave :abc :ij :x)
  # =>
  @[97 105 120]

  )

(comment

  (interleave [0 :a] [1 :b] [2 :c])
  # =>
  @[0 1 2 :a :b :c]

  (interleave @[0 1 2] @[7 8] @[9])
  # =>
  @[0 7 9]

  )

(comment

  (interleave (coro (yield 0) (yield :a))
              (coro (yield 1) (yield :b)))
  # =>
  @[0 1 :a :b]

  )

