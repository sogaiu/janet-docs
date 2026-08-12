```
(defn invert
  ``
  Returns a table where the keys of `x` are the values, and the values
  are the keys. If multiple keys in `x` are mapped to the same value,
  only one of those values will become a key in the returned table.

  `x` can be a bytes, indexed, dictionary, or abstract type with a
  `next` method.
  ``
  [x]
  (def ret @{})
  (loop [k :keys x]
    (put ret (in x k) k))
  ret)
```

(comment

  (invert "hello")
  # =>
  @{101 1 104 0 108 3 111 4}

  (invert @"olleh")
  # =>
  @{101 3 104 4 108 2 111 0}

  )

(comment

  (invert [:a :b :c])
  # =>
  @{:a 0 :b 1 :c 2}

  (invert @[0 0 0])
  # =>
  @{0 2}

  )

(comment

  (invert {:x 1 :y 2})
  # =>
  @{1 :x 2 :y}

  (invert @{:a 1 :b 1})
  # =>
  @{1 :a}

  )

# XXX: is it worth mentioning fibers can be used...
(comment

  (invert (coro (yield :j) (yield :k)))
  # =>
  @{:j 0 :k 0}

  )

