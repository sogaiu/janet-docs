```
(defn geomean
  ``
  Returns the geometric mean of `x`. If empty, returns `math/nan`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [x]
  (if (lengthable? x)
    (do
      (var accum 0)
      (each v x (+= accum (math/log v)))
      (math/exp (/ accum (length x))))
    (do
      (var [accum total] [0 0])
      (each v x (+= accum (math/log v)) (++ total))
      (math/exp (/ accum total)))))
```

(comment

  (defn small?
    [x]
    (< (math/abs x) 1e-13))

  (small? 1e-14)
  # =>
  true

  (small? 1e-12)
  # =>
  false

  )

(comment

  (small? (- 111 (geomean "oooooo")))
  # =>
  true

  (nan? (geomean ""))
  # =>
  true

  )

(comment

  (small? (- 9 (geomean [3 9 27])))
  # =>
  true

  )

(comment

  (small? (- 16 (geomean @{:w 2 :x 8 :y 32 :z 128})))
  # =>
  true

  )

(comment

  (small? (- 9 (geomean (coro (yield 27) (yield 9) (yield 3)))))
  # =>
  true

  )

