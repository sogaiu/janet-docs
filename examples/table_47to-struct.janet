```
JANET_CORE_FN(cfun_table_tostruct,
              "(table/to-struct tab &opt proto)",
              "Return a struct based on a table `tab`. If given, "
              "the optional argument `proto` specifies the new "
              "struct's prototype. Note that if `proto` is not "
              "specified, the new struct will not have a "
              "prototype.") {
```

(comment

  (table/to-struct @{:x 0})
  # =>
  {:x 0}

  )

(comment

  (def st (table/to-struct @{:a 1} {:b 2}))

  (type st)
  # =>
  :struct

  (keys st)
  # =>
  @[:a]

  (get st :a)
  # =>
  1

  (struct/getproto st)
  # =>
  {:b 2}

  (get st :b)
  # =>
  2

  )

(comment

  (def tab @{:a 1})

  (table/setproto tab @{:b 1})

  (def st (table/to-struct tab))

  (struct/getproto st)
  # =>
  nil

  )

