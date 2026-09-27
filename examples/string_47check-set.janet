```
JANET_CORE_FN(cfun_string_checkset,
              "(string/check-set set-bytes bytes)",
              "Checks that only bytes from `set-bytes` are contained in "
              "`bytes`. Returns true if all bytes in `bytes` appear in "
              "`set-bytes` or false if at least one byte in `bytes` does "
              "not appear in `set-bytes`. Both arguments are bytes types.") {
```

(comment

  (string/check-set "acgt" "gattaca")
  # =>
  true

  (string/check-set :abcdef 'deadbeef)
  # =>
  true

  (string/check-set "acdefilop" "encyclopedia")
  # =>
  false

  )

