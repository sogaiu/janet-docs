```
(defn any?
  ``
  Evaluates to the last element of `x` if all preceding elements are
  falsey, `nil` if `x` is empty, or otherwise to the first truthy
  element.

  `x` can be a bytes, indexed. dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (var res nil)
  (loop [v :in x :until res]
    (set res v))
  res)
```

(comment

  (any? "lol")
  # =>
  108

  (any? @"")
  # =>
  nil

  )

(comment

  (any? [nil nil false])
  # =>
  false

  (any? @[nil :goose nil])
  # =>
  :goose

  (any? @[])
  # =>
  nil

  )

(comment

  (any? {:a true :b false})
  # =>
  true

  )

(comment

  (any? (coro (yield false) (yield true) (yield :apple)))
  # =>
  true

  )

