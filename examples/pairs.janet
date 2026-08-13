```
(defn pairs
  ``
  Return an array of tuples of the key-value pairs of `x`. For bytes
  and indexed types, the integer indices are considered the keys.

  `x` can be a bytes, indexed, dictionary, or abstract type with
  suitable `get` and `in` methods.
  ``
  [x]
  (if (lengthable? x)
    (do
      (def arr (array/new-filled (length x)))
      (var i 0)
      (eachp p x
        (put arr i p)
        (++ i))
      arr)
    (seq [p :pairs x] p)))
```

(comment

  (pairs "abc")
  # =>
  @[[0 97] [1 98] [2 99]]

  (pairs @"hi!")
  # =>
  @[[0 104] [1 105] [2 33]]

  (pairs 'pairs)
  # =>
  @[[0 112] [1 97] [2 105] [3 114] [4 115]]

  (pairs :jump)
  # =>
  @[[0 106] [1 117] [2 109] [3 112]]

  )

(comment

  (pairs [:ant :bee :cat])
  # =>
  @[[0 :ant] [1 :bee] [2 :cat]]

  (pairs @[0 1 1 2 3 5 8])
  # =>
  @[[0 0] [1 1] [2 1] [3 2] [4 3] [5 5] [6 8]]

  )

(comment

  (sort (pairs {:a 1 :b 2}))
  # =>
  @[[:a 1] [:b 2]]

  (sort (pairs @{:a 1 :b 2}))
  # =>

  )

# XXX: is it worth mentioning fibers can be used...
(comment

  # fiber keys are always 0
  (pairs (coro (yield :blue) (yield :green) (yield :yellow)))
  # =>
  @[[0 :blue] [0 :green] [0 :yellow]]

  )

