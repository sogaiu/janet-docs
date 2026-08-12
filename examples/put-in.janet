```
(defn put-in
  ``
  Use the keys `ks` to put a value `v` into a nested spot in
  `x`. Missing spots will be replaced with tables. Returns `x`
  modified.

  `x` can be a suitable array, table or abstract type with `get` and
  `put` methods.

  `ks` can be an indexed or abstract type with suitable `get` and
  `length` methods.
  ``
  [x ks v]
  (var d x)
  (def len-1 (- (length ks) 1))
  (if (< len-1 0) (error "expected at least 1 key in ks"))
  (forv i 0 len-1
    (def k (get ks i))
    (def v (get d k))
    (if (= nil v)
      (let [newv (table)]
        (put d k newv)
        (set d newv))
      (set d v)))
  (def last-key (get ks len-1))
  (def last-val (get d last-key))
  (put d last-key v)
  x)
```

(comment

  (put-in @[[0 1] @[]] @[1 0] 1)
  # =>
  @[[0 1] @[1]]

  (put-in @[[0 1] @[2 3]] [1 0] 8)
  # =>
  @[[0 1] @[8 3]]

  (put-in @[[0 1]] [1 0] 11)
  # =>
  @[[0 1] @{0 11}]

  )

(comment

  (put-in @{:a @{:b 2}} @[:a :b] 3)
  # =>
  @{:a @{:b 3}}

  (put-in @{} [:a :b] 1)
  # =>
  @{:a @{:b 1}}

  (put-in @{:x @[]} [:x 0] :treasure)
  # =>
  @{:x @[:treasure]}

  )

