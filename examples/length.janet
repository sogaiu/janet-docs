```
    janet_quick_asm(env, JANET_FUN_LENGTH,
                    "length", 1, 1, 1, 1, length_asm, sizeof(length_asm),
                    JDOC("(length x)\n\n"
                         "Returns the length or count of `x` as an integer. "
                         "Returns are guaranteed to be in constant time "
                         "except for abstract types. For dictionaries, returns "
                         "the number of key-value pairs. `x` can also be a bytes "
                         "or indexed type."));
```

(comment

  (length "hello")
  # =>
  5

  (length @"안녕")
  # =>
  6

  (length 'length)
  # =>
  6

  (length :)
  # =>
  0

  )

(comment

  (length [:highlander])
  # =>
  1

  (length @[3 1 4 1 5 9 2 6 5 3 5])
  # =>
  11

  )

(comment

  (length {:a 1 :b 2})
  # =>
  2

  (length @{:apollo :apollo :artemis :diana :hermes :mercury})
  # =>
  3

  (length (struct/with-proto {:a 1} :B 2))
  # =>
  1

  )

