```
JANET_CORE_FN(cfun_array_remove,
              "(array/remove arr at &opt n)",
              "Remove up to `n` elements starting at index `at` "
              "in array `arr`. `at` can index from the end of the "
              "array with a negative index, and `n` must be a "
              "non-negative integer. By default, `n` is 1. "
              "Returns the array.") {
```

(comment

  (array/remove @[:a :b :c] 0)
  # =>
  @[:b :c]

  (array/remove @[:a :b :c] 0 2)
  # =>
  @[:c]

  (array/remove @[:a :b :c] 1)
  # =>
  @[:a :c]

  )

(comment

  (array/remove @[:a :b :c] -1)
  # =>
  @[:a :b]

  (array/remove @[:a :b :c] -2)
  # =>
  @[:a :c]

  (array/remove @[:a :b :c] -3)
  # =>
  @[:b :c]

  (protect (array/remove @[:a :b :c] -4))
  # =>
  [false "removal index -1 out of range [0,3]"]

  )

# XXX: n > length of input is currently not an error
(comment

  (array/remove @[:a :b :c] 0 4)
  # =>
  @[]

  )

