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

(comment

  (count |(= (chr "l") $) "lol")
  # =>
  2

  )

(comment

  # total of values for which pos? results in truthy value
  (count pos? [math/-inf -1 0 1 math/pi])
  # =>
  2

  # multiple data structures can be handled
  (count (fn [x y] (neg? (+ x y))) [-1 -1 -1] [-1 0 1])
  # =>
  2

  # predicate may not be applied to all values (e.g. 99)
  (count |(pos? (* $0 $1 $2)) [-3 -2] [-1 0 99] [3 2])
  # =>
  1

  )

(comment

  (count odd? @{:x -1 :y 0 :z 3})
  # =>
  2

  )

(comment

  (count neg? (coro (yield -8) (yield 0)))
  # =>
  1

  )

