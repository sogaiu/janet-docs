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
