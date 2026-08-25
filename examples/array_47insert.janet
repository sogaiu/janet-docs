```
JANET_CORE_FN(cfun_array_insert,
              "(array/insert arr at & xs)",
              "Insert all `xs` into array `arr` at index `at`. "
              "`at` should be an integer between 0 and the length "
              "of `arr`, or if negative, `at` will index "
              "backwards from the end of `arr`, inserting after "
              "the index such that inserting at -1 appends to `arr`."
              "Returns the array.") {
```

(comment

  (array/insert @[:b :c] 0 :a)
  # =>
  @[:a :b :c]

  (array/insert @[:a :b] 2 :c)
  # =>
  @[:a :b :c]

  (protect (array/insert @[:a :b] 3 :c))
  # =>
  [false "insertion index 3 out of range [0,2]"]

  (array/insert @[:a :b] -1 :c)
  # =>
  @[:a :b :c]

  (array/insert @[:a :c] -2 :b)
  # =>
  @[:a :b :c]

  (array/insert @[:b :c] -3 :a)
  # =>
  @[:a :b :c]

  (protect (array/insert @[:b :c] -4 :a))
  # =>
  [false "insertion index -1 out of range [0,2]"]

  )

