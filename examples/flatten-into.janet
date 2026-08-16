```
(defn flatten-into
  ``
  Appends the depth-first traversal of an indexed type `ind` into a
  given array `into`. Returns `into`.
  ``
  [into ind]
  (each elt ind
    (if (indexed? elt)
      (flatten-into into elt)
      (array/push into elt)))
  into)
```

(comment

  (flatten-into @[] [[:a :b] [[:c :d] :e]])
  # =>
  @[:a :b :c :d :e]

  (flatten-into @[] @[0 [1 [1]] [[2 [3 5]] 8]])
  # =>
  @[0 1 1 2 3 5 8]

  )

# XXX: questionable whether should mention
(comment

  (flatten-into @[:j] (coro (yield [:k [:l]]) (yield [[:m :n] [:o]])))
  # =>
  @[:j :k :l :m :n :o]

  )

# XXX: questionable whether useful?
(comment

  (flatten-into @[] "abcxyz")
  # =>
  @[97 98 99 120 121 122]

  )

# XXX: questionable order?
(comment

  (flatten-into @[] {:a [[:v :w]] :b [[:x :y] :z]})
  # =>
  @[:x :y :z :v :w]

  )

# https://github.com/janet-lang/janet/commit/f8ab60f4870d6184557f2daee23b2485b5496820

# birth of abstract.c (renaming of userdata.c)
# https://github.com/janet-lang/janet/commit/e4735e14d2906126041bb149fdf43b4893195359#diff-f9943887f70677328a5403fffe4f6c96321f87baabf28015580a4e1eb439b806

