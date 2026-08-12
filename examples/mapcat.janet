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
