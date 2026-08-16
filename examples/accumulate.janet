```
(defn accumulate
  ``
  Similar to `reduce`, but accumulates successive results of applying
  `f` into a new array. The last element in the array is what would be
  the return value from `reduce`. The `init` value is not added
  directly as the first value of the new array, i.e. the returned
  array will have the same number of elements as `x`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [f init x]
  (var res init)
  (def ret @[])
  (each v x (array/push ret (set res (f res v))))
  ret)
```

(comment

  (accumulate + 0 "xyz")
  # =>
  @[120 241 363]

  )

(comment

  (accumulate + 0 @[1 2 3])
  # =>
  @[1 3 6]

  )

(comment

  (accumulate * 1 {:a -1 :b 2 :c -3})
  # =>
  @[2 -6 6]

  )

(comment

  (accumulate + 0 (coro (yield 1) (yield 2) (yield 3)))
  # =>
  @[1 3 6]

  )

