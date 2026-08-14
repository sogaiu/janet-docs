```
(defn interpose
  ``
  Returns an array of the elements of `x` separated by
  `sep`.

  `x` can be a bytes, indexed, fiber or abstract type with suitable
  `get` and `next` methods.
  ``
  [sep x]
  (var k (next x nil))
  (if (not= nil k)
    (if (lengthable? x)
      (do
        (def ret (array/new-filled (- (* 2 (length x)) 1) sep))
        (var i 0)
        (while (not= nil k)
          (put ret i (in x k))
          (set k (next x k))
          (+= i 2))
        ret)
      (do
        (def ret @[(in x k)])
        (while (not= nil (set k (next x k)))
          (array/push ret sep (in x k)))
        ret))
    @[]))
```

(comment

  (interpose ":" "hello")
  # =>
  @[104 ":" 101 ":" 108 ":" 108 ":" 111]

  )

(comment

  (interpose 0 [1 2 3])
  # =>
  @[1 0 2 0 3]

  )

(comment

  (interpose :goose (coro (yield :duck) (yield :duck)))
  # =>
  @[:duck :goose :duck]

  )

