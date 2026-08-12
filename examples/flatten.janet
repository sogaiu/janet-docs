```
(defn flatten
  ``
  Returns a depth first traversal of an indexed type `ind` as a new
  array.
  ``
  [ind]
  (flatten-into @[] ind))
```

(comment

  (flatten [[:a :b] [[:c :d] :e]])
  # =>
  @[:a :b :c :d :e]

  (flatten @[0 [1 [1]] [[2 [3 5]] 8]])
  # =>
  @[0 1 1 2 3 5 8]

  )

# XXX: questionable whether should mention
(comment

  (flatten (coro (yield [:k [:l]]) (yield [[:m :n] [:o]])))
  # =>
  @[:k :l :m :n :o]

  )

# XXX: questionable whether useful?
(comment

  (flatten "abcxyz")
  # =>
  @[97 98 99 120 121 122]

  )

# XXX: questionable order?
(comment

  (flatten {:a [[:v :w]] :b [[:x :y] :z]})
  # =>
  @[:x :y :z :v :w]

  )

