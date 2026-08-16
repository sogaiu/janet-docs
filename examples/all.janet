```
(defn all
  ``
  Apply `pred` to values of `x`. Return true if all results are truthy;
  if any result is falsey, stop applying `pred` and return the result.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `pred`. `pred` is called with both
  values from `x` and additional arguments, and only as many times as
  the length of the shortest of `x` and each element of `xs`. If `x`
  or any element of `xs` is empty, returns true.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``
  [pred x & xs]
  (var res true)
  (map-template :all res pred x xs)
  res)
```

(comment

  (all |(< $ (chr "m")) "abc")
  # =>
  true

  )

(comment

  (all pos? [1 2 3])
  # =>
  true

  (all pos? [1 2 -3])
  # =>
  false

  (all pos? [])
  # =>
  true

  (all truthy? [1 2 3])
  # =>
  true

  (all truthy? [1 2 nil])
  # =>
  false

  # variadic
  (all (fn [x y] (pos? (* x y))) [-1 2] [-2 1])
  # =>
  true

  # predicate may not be applied to all values (e.g. 43)
  (all |(neg? (+ $0 $1 $2)) [-2 2] [1 -8] [0 1 43])
  # =>
  true

  )

(comment

  (all even? {:a 2 :b 8 :c 20})
  # =>
  true

  )

(comment

  (all pos? (coro (yield 1) (yield 2)))
  # =>
  true

  )

