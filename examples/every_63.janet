```
(defn every?
  ``
  Evaluates to the last element of `x` if all preceding elements are
  truthy, true if `x` is empty, or otherwise to the first falsey
  element.

  `x` can be a bytes, indexed. dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (var res true)
  (loop [v :in x :while res]
    (set res v))
  res)
```

(comment

  (every? "hello")
  # =>
  111

  (every? @"")
  # =>
  true

  )

(comment

  (every? [true 'truer nil 'truest])
  # =>
  nil

  (every? @[-2 -1 0])
  # =>
  0

  (every? @[])
  # =>
  true

  )

(comment

  (every? {:a true :b false})
  # =>
  false

  )

(comment

  (every? (coro (yield true) (yield false) (yield :apple)))
  # =>
  false

  )

