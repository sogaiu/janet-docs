```
JANET_CORE_FN(janet_core_getproto,
              "(getproto dict)",
              "Get the prototype of a dictionary `dict`. Returns "
              "`nil` if `dict` has no prototype.") {
```

(comment

  (def proto @{:a 1})
  (def tab @{:b 2})

  (getproto tab)
  # =>
  nil

  (table/setproto tab proto)

  (= (getproto tab) proto)
  # =>
  true

  )

(comment

  (def proto {:a 1})
  (def st1 {:b 2})

  (getproto st1)
  # =>
  nil

  (def st2 (struct/with-proto proto ;(flatten (kvs st1))))

  (= (getproto st2) proto)
  # =>
  true

  )

