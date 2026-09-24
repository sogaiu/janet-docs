```
JANET_CORE_FN(cfun_string_slice,
              "(string/slice bytes &opt start end)",
              "Returns a string based on a range of a byte "
              "sequence `bytes`. The range is specified by "
              "optional index arguments `start` and `end` "
              "defaulting to 0 and the length of `bytes` "
              "respectively. When non-negative, `start` is "
              "inclusive and `end` is exclusive, i.e. [`start`, "
              "`end`), and their values can range from 0 through "
              "the length of `bytes`. When negative, `start` is "
              "exclusive and `end` is inclusive, i.e. (`start`, "
              "`end`], and their values can range from the "
              "negative of one more than the length of `bytes` "
              "through -1. If `start` or `end` is out of range, "
              "an error is raised.") {
```

(comment

  (string/slice "abc" 0 2)
  # =>
  "ab"

  (string/slice "abc" 1 3)
  # =>
  "bc"

  (string/slice :abc 1 3)
  # =>
  "bc"

  (string/slice 'abc 1 3)
  # =>
  "bc"

  (string/slice @"abc" 1 3)
  # =>
  "bc"

  )

(comment

  (string/slice "abc" 1)
  # =>
  "bc"

  (string/slice "abc" 0)
  # =>
  "abc"

  (string/slice "abc")
  # =>
  "abc"

  (string/slice "abc" -1)
  # =>
  ""

  (string/slice "abc" -2)
  # =>
  "c"

  (string/slice "abc" -3)
  # =>
  "bc"

  (string/slice "abc" -4)
  # =>
  "abc"

  )

(comment

  (string/slice "abc" -4 -1)
  # =>
  "abc"

  (string/slice "abc" -4 -2)
  # =>
  "ab"

  (string/slice "abc" -4 -3)
  # =>
  "a"

  (string/slice "abc" -4 -4)
  # =>
  ""

  (protect (string/slice "abc" -4 -5))
  # =>
  [false "end index -5 out of range [-4,3]"]

  )

(comment

  (string/slice "abc" -4 0)
  # =>
  ""

  (string/slice "abc" -4 1)
  # =>
  "a"

  (string/slice "abc" -4 2)
  # =>
  "ab"

  )

