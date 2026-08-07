```
(defn has-value?
  ``
  Checks if `x` contains `value`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type with
  `get` and `next` methods.
  ``
  [x value]
  (not= nil (index-of value x)))
```

# tables
(comment

  (has-value? @{} 0)
  # =>
  false

  (has-value? @{:key1 "foo" :key2 "bar"} "foo")
  # =>
  true

  (has-value? @{:key1 "foo" :key2 "bar"} "hello")
  # =>
  false

  (has-value? @{:key1 "foo" :key2 "bar"} nil)
  # =>
  false

  )

# structs
(comment

  (has-value? {} 0)
  # =>
  false

  (has-value? {:key1 "foo" :key2 "bar"} "foo")
  # =>
  true

  (has-value? {:key1 "foo" :key2 "bar"} "hello")
  # =>
  false

  (has-value? {:key1 "foo" :key2 "bar"} nil)
  # =>
  false

  )

# buffers - individual values are bytes
(comment

  (has-value? "" 0)
  # =>
  false

  (has-value? "" nil)
  # =>
  false

  (has-value? "abc" 97)
  # =>
  true

  (has-value? "abc" "a")
  # =>
  false

  (has-value? "abc" 'a)
  # =>
  false

  )

# tuples
(comment

  (has-value? [] 0)
  # =>
  false

  (has-value? ["a" "b" "c"] "a")
  # =>
  true

  (has-value? ["a" "b" "c"] 'a)
  # =>
  false

  (has-value? ["a" "b" "c"] 97)
  # =>
  false

  )

# arrays
(comment

  (has-value? @[] 0)
  # =>
  false

  (has-value? @["a" "b" "c"] "a")
  # =>
  true

  (has-value? @["a" "b" "c"] 'a)
  # =>
  false

  (has-value? @["a" "b" "c"] 97)
  # =>
  false

  )

