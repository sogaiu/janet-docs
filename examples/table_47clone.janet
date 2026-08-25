```
JANET_CORE_FN(cfun_table_clone,
              "(table/clone tab)",
              "Create a copy of a table. Updates to the new table "
              "will not change the old table, and vice versa.") {
```

(comment

  (def t1 @{:a 1})

  (def t2 (table/clone t1))

  (put t1 :b 2)
  # =>
  @{:a 1 :b 2}

  t2
  # =>
  @{:a 1}

  (put t1 :a nil)
  # =>
  @{:b 2}

  t2
  # =>
  @{:a 1}
  
  (put t1 :a 0)
  # =>
  @{:a 0 :b 2}

  t2
  # =>
  @{:a 1}

  )

