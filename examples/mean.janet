```
(defn mean
  ``
  Returns the mean of `x`. If empty, returns `math/nan`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (if (lengthable? x)
    (/ (sum x) (length x))
    (do
      (var [accum total] [0 0])
      (each v x (+= accum v) (++ total))
      (/ accum total))))
```

(comment

  (mean "oooooo")
  # =>
  111

  (nan? (mean ""))
  # =>
  true

  )

(comment

  (mean [110 111 111 111 112])
  # =>
  111

  )

(comment

  (mean @{:w 110 :x 111 :y 111 :z 112})
  # =>
  111

  )

(comment

  (mean (coro (yield 110) (yield 111) (yield 112)))
  # =>
  111

  )

