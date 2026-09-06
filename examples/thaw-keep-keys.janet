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

(comment

  (thaw-keep-keys "str")
  # =>
  @"str"

  (thaw-keep-keys @"buf")
  # =>
  @"buf"

  (thaw-keep-keys 'sym)
  # =>
  'sym

  (thaw-keep-keys :kwd)
  # =>
  :kwd

  )

(comment

  (thaw-keep-keys [:ant [:bee]])
  # =>
  @[:ant @[:bee]]

  (thaw-keep-keys @["hi" nil])
  # =>
  @[@"hi" nil]

  )

(comment

  (thaw-keep-keys {:a {:b 2}})
  # =>
  @{:a @{:b 2}}

  (thaw-keep-keys @{:x [0 {:a ["hi" 1]}]})
  # =>
  @{:x @[0 @{:a @[@"hi" 1]}]}

  (def key [:hi])
  (def value [0 {:a ["hi" 1]}])
  (def tab @{key value})
  (def thawed (thaw-keep-keys tab))
  (def new-key (first (keys thawed)))

  (= new-key key)
  # =>
  true

  )

(comment

  (thaw-keep-keys nil)
  # =>
  nil

  (thaw-keep-keys true)
  # =>
  true

  (thaw-keep-keys 2.71828)
  # =>
  2.71828

  )

