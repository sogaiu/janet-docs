```
(defn partition-by
  ``
  Partition values of `x` by a function `f`. Partitions split when `f`
  applied to a value changes result when iterating to the next value
  of `x`. Returns a new array of arrays.

  `x` can be a bytes, indexed, fiber, or abstract type with suitable
  `get` and `next` methods.
  ``
  [f x]
  (def ret @[])
  (var span nil)
  (var categ nil)
  (var new? true)
  (each v x
    (def y (f v))
    (cond
      new? (do (set new? false) (set categ y) (set span @[v]) (array/push ret span))
      (= categ y) (array/push span v)
      (do (set categ y) (set span @[v]) (array/push ret span))))
  ret)
```

(comment

  (partition-by even? "hello!")
  # =>
  @[@[104] @[101] @[108 108] @[111 33]]

  (partition-by |(> $ 107) @"hello!")
  # =>
  @[@[104 101] @[108 108 111] @[33]]

  (partition-by identity 'hello!)
  # =>
  @[@[104] @[101] @[108 108] @[111] @[33]]

  (partition-by neg? :hello!)
  # =>
  @[@[104 101 108 108 111 33]]

  )

(comment

  (partition-by keyword? [:ant "bee" 'fox :elephant])
  # =>
  @[@[:ant] @["bee" 'fox] @[:elephant]]

  (partition-by |(has-value? $ (chr "x")) @['sox 'box 'docs 'ox])
  # =>
  @[@['sox 'box] @['docs] @['ox]]

  )

(comment

  (partition-by pos? (coro (yield 1) (yield -1) (yield 2) (yield -3)))
  # =>
  @[@[1] @[-1] @[2] @[-3]]

  )

# XXX: x can be dictionary value but the use may be questionable
#      because the order that values are visited is unspecified
(comment

  )

