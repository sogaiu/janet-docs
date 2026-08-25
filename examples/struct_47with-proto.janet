```
JANET_CORE_FN(cfun_struct_with_proto,
              "(struct/with-proto proto & kvs)",
              "Create a struct using the `proto` argument as "
              "the struct's prototype. `kvs` are as in the "
              "`struct` function.") {
```

(comment

  (def st (struct/with-proto {:b 2} :a 1))

  (struct/getproto st)
  # =>
  {:b 2}

  (get st :a)
  # =>
  1

  )

(comment

  (def st (struct/with-proto {:b 2}))

  (struct/getproto st)
  # =>
  {:b 2}

  (length st)
  # =>
  0

  )

