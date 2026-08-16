```
(defn mapcat
  ``
  Map a function `f` over every value in `x` and use `array/concat` to
  concatenate the results.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `f`. `f` is called with both values
  from `x` and additional arguments, and only as many times as the
  length of the shortest of `x` and each element of `xs`. If `x` or
  any element of `xs` is empty, returns an empty array.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``
  [f x & xs]
  (def res @[])
  (map-template :mapcat res f x xs)
  res)
```

(comment

  (mapcat |(- $ 99) @"abcde")
  # =>
  @[-2 -1 0 1 2]

  )

(comment

  # consolidate with array/concat after applying identity to each
  (mapcat identity [[-2 -1] [0 1 2]])
  # =>
  @[-2 -1 0 1 2]

  # multiple data structures can be handled
  (mapcat tuple [:x :y] [-1 1])
  # =>
  @[:x -1 :y 1]

  # function may not be applied to all values (e.g. :z)
  (mapcat |(tuple $0 $1 $2) [:a :b] [:x :y :z] [0 1])
  # =>
  @[:a :x 0 :b :y 1]

  )

(comment

  (sort (mapcat identity @{:a [-2 -1] :b [0 1]:c [2]}))
  # =>
  @[-2 -1 0 1 2]

  )

(comment

  (mapcat identity (coro (yield [-2 -1]) (yield [0 1 2])))
  # =>
  @[-2 -1 0 1 2]

  )

