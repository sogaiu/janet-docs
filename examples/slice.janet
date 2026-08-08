```
JANET_CORE_FN(janet_core_slice,
              "(slice x &opt start end)",
              "Extract a sub-range of `x`.\n"
              "\n"
              "If `x` is a bytes or abstract type with a suitable "
              "`bytes` method, returns a string.\n"
              "\n"
              "If `x` is an indexed type, returns a tuple.\n"
              "\n"
              "Optional arguments `start` and `end` can be "
              "integers to specify sub-range indices. If neither "
              "is supplied, uses the full range.") {
    JanetRange range;
    JanetByteView bview;
    JanetView iview;
    if (janet_bytes_view(argv[0], &bview.bytes, &bview.len)) {
        range = janet_getslice(argc, argv);
        return janet_stringv(bview.bytes + range.start, range.end - rang
    } else if (janet_indexed_view(argv[0], &iview.items, &iview.len)) {
        range = janet_getslice(argc, argv);
        return janet_wrap_tuple(janet_tuple_n(iview.items + range.start,
    } else {
        janet_panic_type(argv[0], 0, JANET_TFLAG_BYTES | JANET_TFLAG_IND
    }
}
```

(comment

  (slice "abcdefg" 0 2)
  # =>
  "ab"

  (slice @"abcdefg" 0 2)
  # =>
  "ab"

  )

(comment

  (slice @[1 2 3])
  # =>
  [1 2 3]

  (slice @[:a :b :c] 1)
  # =>
  [:b :c]

  (slice [:a :b :c :d :e] 2 4)
  # =>
  [:c :d]

  (slice [:a :b :c :d :e] 2 -1)
  # =>
  [:c :d :e]

  (slice [:a :b :c :d :e] 2 -2)
  # =>
  [:c :d]

  (slice [:a :b :c :d :e] 2 -4)
  # =>
  []

  # errors because end index -10 out of range [-6,5]
  (protect
    (slice [:a :b :c :d :e] 2 -10))

  )

