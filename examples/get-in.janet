```
(defn get-in                                                            
  ``
  Use the keys `ks` to look up a nested value in `x`. If a value is
  not found, will return `dflt` if provided, or `nil` otherwise.

  `x` can be a suitable indexed, dictionary, or abstract type with a
  `get` method.

  `ks` can be an indexed, fiber, or abstract type with `get` and
  `next` methods.
  ``
  [x ks &opt dflt]                                                     
  (var d x)                                                            
  (loop [k :in ks :while (not (nil? d))] (set d (get d k)))             
  (if (= nil d) dflt d))
```

(comment

  (get-in {:a {:b 1}} [:a :b])
  # =>
  1

  (get-in {:a {:b 1}} @[:a :b])
  # =>
  1

  (get-in {:a {:b 1}} @[:a :c] :oops)
  # =>
  :oops

  (get-in {:a {:b 1}} (coro (yield :a) (yield :b)))
  # =>
  1

  (get-in [[0 1] [2 3]] [1 0])
  # =>
  2

  (get-in [[0 1] [2 3]] [1 2] :missed!)
  # =>
  :missed!

  (get-in [[0 1] [2 3]] @[1 0])
  # =>
  2

  (get-in [[0 1] [2 3]] (coro (yield 1) (yield 0)))
  # =>
  2

  )

