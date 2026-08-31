```
JANET_CORE_FN(cfun_table_clone,
              "(table/clone tab)",
              "Create a copy of a table. Updates to the new table "
              "will not change the old table, and vice versa.") {
```

(comment

  (def t1 @{:a 1})

  (def t2 (table/clone t1))

  # update t1 by adding a key-value pair
  (put t1 :b 2)
  # =>
  @{:a 1 :b 2}

  # t2 unaffected
  t2
  # =>
  @{:a 1}

  # update t1 by removing a key-value pair
  (put t1 :a nil)
  # =>
  @{:b 2}

  # t2 unaffected
  t2
  # =>
  @{:a 1}

  # update t1 by changing a key-value pair's value
  (put t1 :a 0)
  # =>
  @{:a 0 :b 2}

  # t2 unaffected
  t2
  # =>
  @{:a 1}

  )

(comment

  (def arr @[:x])

  # tables are a collection of key-value pairs
  (def t1 @{:a arr})

  (def t2 (table/clone t1))

  # t1 and t2 have key-value pairs with values that are the same
  (= (get t1 :a) (get t2 :a))
  # =>
  true

  # the key-value pairs' values are all the same array
  (= (get t1 :a) (get t2 :a) arr)
  # =>
  true

  # this does not count as updating t1 or t2
  (array/push arr :y)
  # =>
  arr

  # `arr` does have two elements now
  (= 2 (length arr))
  # =>
  true

  # the value of each table's key-value pair is still `arr`, i.e. the
  # tables have not been updated.
  (= (get t1 :a) (get t2 :a) arr)
  # =>
  true

  )

