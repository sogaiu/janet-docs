```
(defn count
  ``
  Count the number of values in `x` for which applying `pred` yields a
  truthy value.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `pred`. `pred` is called with both
  values from `x` and additional arguments, and only as many times as
  the length of the shortest of `x` and each element of `xs`. If `x`
  or any element of `xs` is empty, returns 0.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``
  [pred x & xs]
  (var res 0)
  (map-template :count res pred x xs)
  res)
```
