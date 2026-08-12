```
(defn keys
  ``
  Get the keys of `x` as an array.

  `x` can be a bytes, indexed, dictionary, or abstract type with a
  suitable `next` method.
  ``
  [x]
  (if (lengthable? x)
    (do
      (def arr (array/new-filled (length x)))
      (var i 0)
      (eachk k x
        (put arr i k)
        (++ i))
      arr)
    (seq [k :keys x] k)))
```

(comment

  (keys "grin")
  # =>
  @[0 1 2 3]

  )

(comment

  (keys ['alice 'bob 'eve])
  # =>
  @[0 1 2]

  )

(comment

  (sort (keys {:a 1 :b 2}))
  # =>
  @[:a :b]

  )

# XXX: is it worth mentioning fibers can be used...
(comment

  # a fiber's keys are always 0
  (keys (coro (yield :zero) (yield :one) (yield :two)))
  # =>
  @[0 0 0]

  )

