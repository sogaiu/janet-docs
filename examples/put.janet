```
janet_quick_asm(env, JANET_FUN_PUT,
                "put", 3, 3, 3, 3, put_asm, sizeof(put_asm),
                JDOC("(put x key val)\n\n"
                     "Associate `key` with `val` for mutable `x`. Buffers "
                     "and tables only accept non-negative integer keys, and "
                     "will expand if an out of bounds value is provided. "
                     "For an array, extra space will be filled with `nil`s, "
                     "while for buffers, 0 bytes are used instead. For a "
                     "table, putting a key that is in the table prototype "
                     "will hide the association defined by the prototype, "
                     "but will not mutate the prototype table. Putting a "
                     "`nil` value into a table will remove the table's "
                     "corresponding association. Returns `x`."));
```

(comment

  (put @"jam" 0 100)
  # =>
  @"dam"

  )

(comment

  (put @[:a :B :c] 1 :b)
  # =>
  @[:a :b :c]

  )

(comment

  (put @{:length 10 :width 20} :length 20)
  # =>
  @{:length 20 :width 20}

  (put (table/setproto @{:a 1} @{:b 3}) :b 2)
  # =>
  @{:a 1 :b 2}

  (put @{:error :many} :error nil)
  # =>
  @{}

  )

