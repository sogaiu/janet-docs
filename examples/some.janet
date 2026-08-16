```
(defn some
  ``
  Returns `nil` if applying `pred` to every value in `x` results in
  only falsey values, otherwise returns the first truthy result
  encountered.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `f`. `f` is called with both values
  from `x` and additional arguments, and only as many times as the
  length of the shortest of `x` and each element of `xs`. If `x` or
  any element of `xs` is empty, returns `nil`.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``
  [pred x & xs]
  (var res nil)
  (map-template :some res pred x xs)
  res)
```

(comment

  (some |(< (chr "a") $) @"bcd")
  # =>
  true

  )

(comment

  # pos? yielded only falsey values, so nil returned
  (some pos? [math/-inf 0])
  # =>
  nil

  # first truthy result encountered is returned
  (some (fn [x] (when (pos? x) x)) [1 0 -1])
  # =>
  1

  # input data structure is empty, so nil returned
  (some pos? [])
  # =>
  nil

  # multiple data structures can be handled
  (some (fn [x y] (neg? (* x y))) [1 1] [1 -2])
  # =>
  true

  # predicate not always called with all values (e.g. 0)
  (some |(zero? (* $0 $1 $2)) [1 2] [7 8] [-2 -1 0])
  # =>
  nil

  # one of the input data structures was empty, so nil returned
  (some |(pos? (+ $0 $1 $2)) [1 2 3] [7 8 9] [])
  # =>
  nil

  )

(comment

  (some neg? {:a -1 :b 1})
  # =>
  true

  )

(comment

  (some even? (coro (yield 1) (yield 3) (yield 8)))
  # =>
  true

  )

