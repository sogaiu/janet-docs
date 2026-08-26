```
JANET_CORE_FN(cfun_array_slice,
              "(array/slice arrtup &opt start end)",
              "Takes a slice of an array or tuple from `start` to "
              "`end`. The range is half open, [start, end). "
              "Indices can also be negative, indicating indexing "
              "from the end of the array. By default, `start` is "
              "0 and `end` is the length of the array. Note that "
              "if the range is negative, it is taken as (start, "
              "end] to allow a full negative slice range. "
              "Returns a new array.") {
```

```
                     | :a | :b | :c |

      item index:      0    1    2

     slice index:    0    1    2    3

 neg slice index:   -4   -3   -2   -1

```

(comment

  (array/slice @[:a :b :c] 0 2)
  # =>
  @[:a :b]

  (array/slice @[:a :b :c] 1 3)
  # =>
  @[:b :c]

  )

(comment

  (array/slice @[:a :b :c] 1)
  # =>
  @[:b :c]

  (array/slice @[:a :b :c] 0)
  # =>
  @[:a :b :c]

  (array/slice @[:a :b :c])
  # =>
  @[:a :b :c]

  (array/slice @[:a :b :c] -1)
  # =>
  @[]

  (array/slice @[:a :b :c] -2)
  # =>
  @[:c]

  (array/slice @[:a :b :c] -3)
  # =>
  @[:b :c]

  (array/slice @[:a :b :c] -4)
  # =>
  @[:a :b :c]

  )

(comment

  (array/slice @[:a :b :c] -4 -1)
  # =>
  @[:a :b :c]

  (array/slice @[:a :b :c] -4 -2)
  # =>
  @[:a :b]

  (array/slice @[:a :b :c] -4 -3)
  # =>
  @[:a]

  (array/slice @[:a :b :c] -4 -4)
  # =>
  @[]

  (protect (array/slice @[:a :b :c] -4 -5))
  # =>
  [false "end index -5 out of range [-4,3]"]

  )

(comment

  (array/slice @[:a :b :c] -4 0)
  # =>
  @[]

  (array/slice @[:a :b :c] -4 1)
  # =>
  @[:a]

  (array/slice @[:a :b :c] -4 2)
  # =>
  @[:a :b]

  )

