```
(defn index-of
  ``
  Find the first key associated with a value `v` in `x`, acting like a
  reverse lookup.  Will not look at dictionary prototypes.  If not
  found, returns `dflt` if provided and `nil` otherwise.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [v x &opt dflt]
  (var k (next x nil))
  (var ret dflt)
  (while (not= nil k)
    (when (= (in x k) v) (set ret k) (break))
    (set k (next x k)))
  ret)
```

(comment

  (index-of (chr "_") "(^_^)")
  # =>
  2

  (index-of (chr "l") @"hello")
  # =>
  2

  (index-of (chr "x") 'target)
  # =>
  nil

  (index-of (chr "c") :keyword :empty-handed)
  # =>
  :empty-handed

  )

(comment

  (index-of :secret [:ant :bee :secret :rooster])
  # =>
  2

  (index-of 1 @[0 1 1 2 3 5 8 13])
  # =>
  1

  )

(comment

  (index-of 2 {:a 1 :b 2})
  # =>
  :b

  (index-of :needle @{} :blank)
  # =>
  :blank

  (index-of :x (struct/with-proto {:x 8} :a 1) :not-found!)
  # =>
  :not-found!

  )

(comment

  # every key in a fiber is 0
  (index-of :x (coro (yield :x) (yield :y) (yield :z)))
  # =>
  0

  (index-of :y (coro (yield :x) (yield :y) (yield :z)))
  # =>
  0

  (index-of :z (coro (yield :x) (yield :y) (yield :z)))
  # =>
  0

  )

