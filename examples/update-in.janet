```
(defn update-in
  ``
  Update a value in `x`. Looks into a nested spot in `x` identified by
  the keys `ks` and replaces the value found there with `f` applied to
  that value and any values passed and available in `args`.  Missing
  spots will be replaced with tables and `f` is passed `nil` instead
  of a found value.  Returns `x` modified.

  `x` can be a suitable array, table or abstract type with `get` and
  `put` methods.

  `ks` can be an indexed or abstract type with suitable `get` and
  `length` methods.
  ``
  [x ks f & args]
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
  (put d last-key (f last-val ;args))
  x)
```

(comment

  (update-in @[[0 1] @[2 3]] [1 0] |(+ $0 $1) 9)
  # =>
  @[[0 1] @[11 3]]

  (update-in @[[0 1] @[]] @[1 0] |(if $0 0 $1) 8)
  # =>
  @[[0 1] @[8]]

  )

(comment

  (update-in @{:a @{:b 2}} [:a :b] inc)
  # =>
  @{:a @{:b 3}}

  (update-in @{} [:x :y] |(do $1) :z)
  # =>
  @{:x @{:y :z}}

  (update-in @{:a @{}} [:a :b] |(if $ :yeah :nope))
  # =>
  @{:a @{:b :nope}}

  (update-in @{:x @[]} [:x 0] |(do $1) :treasure)
  # =>
  @{:x @[:treasure]}

  )

