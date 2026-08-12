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
