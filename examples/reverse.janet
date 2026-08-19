```
(defn reverse
  ``
  Reverses the order of the values in `x`. If `x` is a bytes type,
  returns a buffer, otherwise returns an array.

  `x` can be a bytes, indexed, fiber, or abstract type with suitable
  `get` and `next` methods.
  ``
  [x]
  (if (lengthable? x)
    (do
      (var n (length x))
      (def ret (if (bytes? x)
                 (buffer/new-filled n)
                 (array/new-filled n)))
      (each v x
        (put ret (-- n) v))
      ret)
    (reverse! (seq [v :in x] v))))
```

(comment

  (reverse "aloha")
  # =>
  @"ahola"

  )

(comment

  (reverse [2 3 5 7])
  # =>
  @[7 5 3 2]

  )

(comment

  (reverse (coro (yield :ant) (yield :bee)))
  # =>
  @[:bee :ant]

  )

# XXX: questionable utility
(comment

  (reverse {:a 1 :b 2})
  # =>
  @[1 2]

  )

