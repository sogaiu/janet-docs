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

  (slice "hello")
  # =>
  "hello"

  (slice @"bye" 2)
  # =>
  "e"

  (slice :unlockable 2 6)
  # =>
  "lock"

  (slice 'unlucky -6)
  # =>
  "lucky"

  )

(comment

  (slice [:bread :cheese :mustard :bread] 1 -2)
  # =>
  [:cheese :mustard]

  (slice @["life"] 0)
  # =>
  ["life"]

  )

