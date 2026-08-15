```
(defn accumulate2
  ``
  The 2-argument version of `accumulate`. Instead of taking an
  explicit initial value, the first value of `x` is used instead. If
  `x` is empty, returns an empty array.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [f x]
  (var k (next x))
  (def ret @[])
  (if (= nil k) (break ret))
  (var res (in x k))
  (array/push ret res)
  (set k (next x k))
  (while (not= nil k)
    (set res (f res (in x k)))
    (array/push ret res)
    (set k (next x k)))
  ret)
```

(comment

  (accumulate2 + "hi")
  # =>
  @[104 209]

  (accumulate2 - @"")
  # =>
  @[]

  )

(comment

  (accumulate2 / [32 8 4])
  # =>
  @[32 4 1]

  )

(comment

  (accumulate2 * {:a 1 :b 2 :c 4})
  # =>
  @[2 8 8]

  )

(comment

  (accumulate2 * (coro (yield 4) (yield 2) (yield 1)))
  # =>
  @[4 8 8]

  )

