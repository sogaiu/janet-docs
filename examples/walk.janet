```
(defn walk
  ``
  Iterate over `ast` and apply `f` to encountered items, collecting
  the results in a result of the same type. For indexed types, `f` is
  applied only to its values, while for dictionaries, `f` is applied
  to keys as well as values.

  If `ast` is not an indexed type or dictionary, returns `ast`
  unchanged.
  ``
  [f ast]
  (case (type ast)
    :table (walk-dict f ast)
    :struct (table/to-struct (walk-dict f ast))
    :array (walk-ind f ast)
    :tuple (keep-syntax! ast (walk-ind f ast))
    ast))
```

(comment

  (walk inc [0 1 2])
  # =>
  [1 2 3]

  (walk |(* -1 $) @[8 9 10])
  # =>
  @[-8 -9 -10]

  (walk dec {1 2 8 9})
  # =>
  {0 1 7 8}

  (walk |(* $ $ $) @{0 1 2 3})
  # =>
  @{0 1 8 27}

  (walk + "hello")
  # =>
  "hello"

  )

