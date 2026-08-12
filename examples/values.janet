```
(defn values
  ``
  Get the values of `x` as an array.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (if (lengthable? x)
    (do
      (def arr (array/new-filled (length x)))
      (var i 0)
      (each v x
        (put arr i v)
        (++ i))
      arr)
    (seq [v :in x] v)))
```

(comment

  (values "xyz")
  # =>
  @[120 121 122]

  (values 'abc)
  # =>
  @[97 98 99]

  )

(comment

  (values ['tom 'dick 'harry])
  # =>
  @['tom 'dick 'harry]

  (values @['anne 'jane 'mary])
  # =>
  @['anne 'jane 'mary]

  )

(comment

  (sort (values {0 :ant 1 :bee 2 :cat}))
  # =>
  @[:ant :bee :cat]

  (sort (values @{:a 1 :b 2 :c 3}))
  # =>
  @[1 2 3]

  )

(comment

  (values (coro (yield :zero) (yield :one) (yield :two)))
  # =>
  @[:zero :one :two]

  )

