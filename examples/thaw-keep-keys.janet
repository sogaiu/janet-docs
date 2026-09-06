```
(defn thaw-keep-keys
  ``
  Similar to `thaw`, but does not modify dictionary keys.
  ``
  [x]
  (case (type x)
    :array (walk-ind thaw-keep-keys x)
    :tuple (walk-ind thaw-keep-keys x)
    :table (walk-dict-values thaw-keep-keys (table/proto-flatten x))
    :struct (walk-dict-values thaw-keep-keys (struct/proto-flatten x))
    :string (buffer x)
    x))
```
