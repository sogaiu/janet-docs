```
(defn last
  ``
  Get the last element from `x`.

  If `x` is a non-empty bytes or indexed type value, return the last
  element.

  If `x` is an abstract type value with suitable `get` and `length`
  methods, call the `get` method with one less than the result of
  calling the `length` method.
  ``
  [x]
  (get x (- (length x) 1)))
```

(comment

  (last "smile!")
  # =>
  33

  (last @"quack!")
  # =>
  33

  (last :inconceivable!)
  # =>
  33

  (last 'ay-caramba!)
  # =>
  33

  )

(comment

  (last [0 1 2 3 4 5])
  # =>
  5

  (last @[:christmas :emperor :mohicans :night :star-fighter])
  # =>
  :star-fighter

  )

