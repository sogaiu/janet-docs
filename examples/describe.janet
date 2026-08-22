```
JANET_CORE_FN(janet_core_describe,
              "(describe x)",
              "Returns a string that is a human-readable description of "
              "`x`. For indexed, dictionary, fiber, pointer, and some "
              "abstract types, the string returned contains a pointer "
              "value from which the identity of `x` can be determined.") {
    JanetBuffer *b = janet_buffer(0);
    for (int32_t i = 0; i < argc; ++i)
        janet_description_b(b, argv[i]);
    return janet_stringv(b->data, b->count);
}
```

(comment

  (describe "hi")
  # =>
  `"hi"`

  (string/has-prefix? "<cfunction describe" (describe describe))
  # =>
  true

  (string/has-prefix? "<function pp" (describe pp))
  # =>
  true

  (string/has-prefix? "<tuple 0x" (describe [:a :b]))
  # =>
  true

  (string/has-prefix? "<table 0x" (describe @{:x 1}))
  # =>
  true

  (string/has-prefix? "<fiber 0x" (describe (coro (yield :O))))
  # =>
  true

  (ffi/context nil)
  (ffi/defbind memcpy :ptr [dest :ptr src :ptr n :size])
  (string/has-prefix? "<pointer 0x" (describe (memcpy @"a" @"b" 1)))
  # =>
  true

  (string/has-prefix? "<core/peg 0x" (describe (peg/compile 1)))
  # =>
  true

  )

