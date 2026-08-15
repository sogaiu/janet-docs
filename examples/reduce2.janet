```
(defn reduce2
  ``
  The 2-argument version of `reduce`. Instead of taking an explicit
  initial value, the first value of `x` is used instead. If `x` is
  empty, returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [f x]
  (var k (next x))
  (if (= nil k) (break nil))
  (var res (in x k))
  (set k (next x k))
  (while (not= nil k)
    (set res (f res (in x k)))
    (set k (next x k)))
  res)

```

(comment

  (reduce2 + "hi")
  # =>
  209

  (reduce2 / "")
  # =>
  nil

  )

(comment

  (reduce2 / [32 8 4])
  # =>
  1

  )

(comment

  (reduce2 * {:a 1 :b 2 :c 4})
  # =>
  8

  )

(comment

  (reduce2 * (coro (yield 4) (yield 2) (yield 1)))
  # =>
  8

  )

