```
(defn zipcoll
  ``
  Creates a table from `ks` and `vs`, by pairing values at the same
  index from each. If `ks` or `vs` has more values than the other, the
  extra values are ignored. Returns a new table.

  `ks` and `vs` can by bytes, indexed, fibers, or abstract types with
  suitable `get` and `next` methods.
  ``
  [ks vs]
  (def res @{})
  (var kk nil)
  (var vk nil)
  (while true
    (set kk (next ks kk))
    (if (= nil kk) (break))
    (set vk (next vs vk))
    (if (= nil vk) (break))
    (put res (in ks kk) (in vs vk)))
  res)
```

(comment

  (zipcoll "x" "y")
  # =>
  @{120 121}

  (zipcoll 'if 'do)
  # =>
  @{102 111 105 100}

  (zipcoll :a :xy)
  # =>
  @{97 120}

  )

(comment

  (zipcoll [:a] [1])
  # =>
  @{:a 1}

  (zipcoll @[:x :y] @[0])
  # =>
  @{:x 0}

  (zipcoll @[:x] [0 1])
  # =>
  @{:x 0}

  )

(comment

  (zipcoll (coro (yield :a)) (coro (yield 1)))
  # =>
  @{:a 1}

  )

(comment

  (zipcoll [:a] (coro (yield :1)))
  # =>
  @{:a :1}

  )

