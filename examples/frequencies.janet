```
(defn frequencies
  ``
  Returns a table of occurrences of each value in `x`.

  `x` can be a value of type bytes, indexed, dictionary, fiber, or
  abstract with `get` and `next` methods.
  ``
  [x]
  (def freqs @{})
  (each elt x
    (put freqs elt (inc (in freqs elt))))
  freqs)
```

(comment

  (frequencies "all")
  # =>
  @{97 1 108 2}

  (frequencies @"all")
  # =>
  @{97 1 108 2}

  (frequencies 'lol)
  # =>
  @{108 2 111 1}

  (frequencies :lol)
  # =>
  @{108 2 111 1}

  )

(comment

  (frequencies [:duck :duck :duck :goose])
  # =>
  @{:duck 3 :goose 1}

  (frequencies @[3 1 4 1 5 9 2 6 5 3])
  # =>
  @{1 2 2 1 3 2 4 1 5 2 6 1 9 1}

  )

(comment

  (frequencies {1 :a 2 :x 3 :x 8 :a})
  # =>
  @{:a 2 :x 2}

  (frequencies @{})
  # =>
  @{}

  )

(comment

  (frequencies (coro (yield 1) (yield 8) (yield 2) (yield 8)))
  # =>
  @{1 1 2 1 8 2}

  )

