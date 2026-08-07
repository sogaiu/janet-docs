```
(defn has-key?
  ``
  Check if `x` maps `key` to a non-nil value.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with a `get` method.
  ``
  [x key]
  (not= nil (get x key)))
```

# tables
(comment

  (has-key? @{} 0)
  # =>
  false

  (has-key? @{:key1 "foo" :key2 "bar"} :key1)
  # =>
  true

  (has-key? @{:key1 "foo" :key2 "bar"} :key3)
  # =>
  false

  )

# structs
(comment

  (has-key? {} 0)
  # =>
  false

  (has-key? {:key1 "foo" :key2 "bar"} :key1)
  # =>
  true

  (has-key? {:key1 "foo" :key2 "bar"} :key3)
  # =>
  false

  )

# buffers, tuples and arrays check for index as key
(comment

  (has-key? "" 0)
  # =>
  false

  (has-key? "a" 0)
  # =>
  true

  (has-key? "a" 1)
  # =>
  false

  )

(comment

  (has-key? [] 0)
  # =>
  false

  (has-key? ["a" "b" "c"] 1)
  # =>
  true

  (has-key? ["a" "b" "c"] 4)
  # =>
  false

  )

(comment

  (has-key? @[] 0)
  # =>
  false

  (has-key? @["a" "b" "c"] 1)
  # =>
  true

  (has-key? @["a" "b" "c"] 4)
  # =>
  false

  )

