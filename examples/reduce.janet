```
(defn reduce
  ``
  Also know as fold-left in many languages, this function transforms
  `x` by successively applying a function `f` to values from `x` and
  an updating "accumulator" value. `f` is a function of 2 arguments,
  `(f acc v)`, where `acc` starts as `init` and `v` is the next value
  in `x`. `f` returns a value that will be used as `acc` in the next
  call to `f`. The ultimate return value is that of the final call to
  `f`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``
  [f init x]
  (var acc init)
  (each v x (set acc (f acc v)))
  acc)
```

(comment

  (reduce + 0 "xyz")
  # =>
  363

  (reduce array/push @[] :abc)
  # =>
  @[97 98 99]

  (reduce |(buffer/push-byte $0 $1 (chr "|")) @"|" 'xyz)
  # =>
  @"|x|y|z|"

  )

(comment

  (reduce merge-into @{} [{:a 1} {:b 2}])
  # =>
  @{:a 1 :b 2}

  (reduce buffer/push @"" @[:mar :ma :lade])
  # =>
  @"marmalade"

  )

(comment

  (reduce * 1 {:a -1 :b 2 :c -3})
  # =>
  6

  (reduce |(merge-into $0 @{$1 1}) @{} @{0 :ant 1 :bee 2 :cat})
  # =>
  @{:ant 1 :bee 1 :cat 1}

  )

(comment

  (reduce + 0 (coro (yield 1) (yield 2) (yield 3)))
  # =>
  6

  )

