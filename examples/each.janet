```
(defmacro each
  ``
  Loop over each value in `x` with each value of `x` bound to
  `binding` with destructuring support. Returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [binding x & body]
  (each-template binding x :each body))
```

(comment

  (def buf @"")

  (each b "hello" (buffer/push buf b))

  buf
  # =>
  @"hello"

  )

(comment

  # prints 12345
  (each x @[1 2 3 4 5] (prin x))
  # =>
  nil

  (def arr @[])

  (each [_ [a b]] [[:x [0 1]] [:y [-1 0]]]
    (array/push arr b a))
  # =>
  nil

  arr
  # =>
  @[1 0 0 -1]

  )

(comment

  # prints values from struct in an unspecified order
  # 21 -or- 12
  (each x {:a 1 :b 2} (prin x))
  # =>
  nil

  (def arr @[])

  (each [a b] @{:x [0 1] :y [-1 0]}
    (array/push arr a b))
  # =>
  nil

  arr
  # =>
  @[0 1 -1 0]

  )

(comment

  (def tab @{})

  (each [k v] (coro (yield [0 1]) (yield [2 8]))
    (put tab v k))
  # =>
  nil

  tab
  # =>
  @{1 0 8 2}

  )

