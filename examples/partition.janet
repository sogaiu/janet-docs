```
(defn partition
  ``
  Partition the values of `x` into tuples of size `n`. Returns a new
  array.

  `n` should be a non-negative integer.

  `x` can be a bytes, indexed, fiber, or abstract type with suitable
  `get` and `next` methods.

  ``
  [n x]
  (cond
    (indexed? x) (partition-slice tuple/slice n x)
    (bytes? x) (partition-slice string/slice n x)
    (partition-slice tuple/slice n (values x))))
```

(comment

  (partition 2 "hello!")
  # =>
  @["he" "ll" "o!"]

  (partition 3 @"hello!")
  # =>
  @["hel" "lo!"]

  (partition 4 'hello!)
  # =>
  @["hell" "o!"]

  (partition 5 :hello!)
  # =>
  @["hello" "!"]

  )

(comment

  (partition 2 [:ant :bee :fox :elephant])
  # =>
  @[[:ant :bee] [:fox :elephant]]

  (partition 3 @['rock 'paper 'scissors 'spock])
  # =>
  @[['rock 'paper 'scissors] ['spock]]

  )

(comment

  (partition 2 (coro (yield 0) (yield 1) (yield 2) (yield 3)))
  # =>
  @[[0 1] [2 3]]

  )

# XXX: x can be dictionary value but the use may be questionable
#      because the order that values are visited is unspecified
(comment

  (partition 2 {:name "james" :profession "secret"})
  # = >
  @[["james" "secret"]]

  (partition 1 @{:x 5 :y 12 :z 13})
  # = >
  @[[5] [13] [12]]

  )

