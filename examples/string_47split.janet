```
JANET_CORE_FN(cfun_string_split,
              "(string/split sep str &opt start limit)",
              "Splits a string `str` with separator `sep` and returns an "
              "array of substrings. The substrings will not contain `sep`. "
              "If `sep` is not found, the returned array will have one "
              "element. Will start searching for `sep` at the index `start` "
              "(if provided), and return up to a maximum of `limit` results "
              "(if provided).") {
```

(comment

  (string/split "," "ant,bee,cat,dog")
  # =>
  @["ant" "bee" "cat" "dog"]

  (string/split "," "ant,bee,cat,dog" 4)
  # =>
  @["ant,bee" "cat" "dog"]

  (string/split "," "ant,bee,cat,dog" 4 2)
  # =>
  @["ant,bee" "cat,dog"]

  (string/split ";" "ant,bee,cat,dog")
  # =>
  @["ant,bee,cat,dog"]

  )

