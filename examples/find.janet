```
(defn find
  ``
  Find the first value in `x` that satisfies `pred`. If not found,
  return `dflt` if given, or `nil` otherwise.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [pred x &opt dflt]
  (var k nil)
  (var ret dflt)
  (while true
    (set k (next x k))
    (if (= k nil) (break))
    (def item (in x k))
    (when (pred item)
      (set ret item)
      (break)))
  ret)
```

(comment

  (find |(= $ (chr "o")) "tomato")
  # =>
  111

  (find |(= $ (chr "m")) "potato")
  # =>
  nil

  (find |(> $ (chr "y")) :ant :surprise)
  # =>
  :surprise

  (find |(< (chr "a") $ (chr "k")) 'lynx)
  # =>
  nil

  )

(comment

  (find pos? [-1 0 11])
  # =>
  11

  (find neg? @[0 1 2 3 5])
  # =>
  nil

  )

(comment

  (find one? {:a 1 :b 2})
  # =>
  1

  (find even? @{:x 11 :y 28 :z 33})
  # =>
  28

  )

(comment

  (find keyword? (coro (yield 'jump) (yield :wave)))
  # =>
  :wave

  )

