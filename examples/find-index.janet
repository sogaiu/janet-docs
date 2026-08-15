```
(defn find-index
  ``
  Find the index of `x` for which `pred` is true. If not found, return
  `dflt` if provided, or `nil` otherwise.

  `x` can be a bytes, indexed, dictionary, or abstract type with
  suitable `get` and `next` methods.
  ``
  [pred x &opt dflt]
  (var k nil)
  (var ret dflt)
  (while true
    (set k (next x k))
    (if (= k nil) (break))
    (def item (in x k))
    (when (pred item)
      (set ret k)
      (break)))
  ret)
```

(comment

  (find-index |(= (chr "c") $) "abc")
  # =>
  2

  )

(comment

  (find-index |(= $ :goose) [:duck :duck :goose])
  # =>
  2

  (find-index pos? @[-2 -1 0 -3] :surprise!)
  # =>
  :surprise!

  )

(comment

  (find-index zero? {:a 2 :b 1 :c 0})
  # =>
  :c

  )

# XXX: if anything is found, the answer will always be 0
(comment

  (find-index even? (coro (yield 3) (yield 1) (yield 8)))
  # =>
  0

  )

