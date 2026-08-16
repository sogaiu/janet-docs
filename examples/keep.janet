```
(defn keep
  ``
  Given a predicate `pred`, return a new array containing the truthy
  results of applying `pred` to each value in `x`.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `pred`. `pred` is called with both
  values from `x` and additional arguments, and only as many times as
  the length of the shortest of `x` and each element of `xs`. If `x`
  or any element of `xs` is empty, returns an empty array.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``
  [pred x & xs]
  (def res @[])
  (map-template :keep res pred x xs)
  res)
```

(comment

  (keep identity @"abc")
  # =>
  @[97 98 99]

  )

(comment

  # returns an array of truthy results of predicate
  (keep identity [false :x nil true])
  # =>
  @[:x true]

  # keep values > 1, equivalent to filter
  (keep (fn [x] (when (> x 1) x)) @[0 1 2 3])
  # =>
  @[2 3]

  # for all members > 2, keep the square
  (keep (fn [x] (when (> x 2) (* x x))) [0 1 3 4 5])
  # =>
  @[9 16 25]

  # multiple data structures can be handled
  (keep |(when (pos? (+ $0 $1)) $0) [1 2 3] [-1 1 1])
  # =>
  @[2 3]

  # result has length <= shortest data structure (e.g. [-1 1])
  (keep |(when (neg? (* $0 $1)) $0) [-1 -2 -3] [-1 1])
  # =>
  @[-2]

  )

(comment

  (sort (keep |(+ 7 $) {:a 1 :b 2 :c 3}))
  # =>
  @[8 9 10]

  )

(comment

  (keep |(* -1 $) (coro (yield 0) (yield 1) (yield 2)))
  # =>
  @[0 -1 -2]

  )

