```
(defmacro eachk
  ``
  Loop over each key in `x` with each key bound to `binding` with
  destructuring support. Returns `nil`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with a suitable `next` method.
  ``
  [binding x & body]
  (each-template binding x :keys body))
```

(comment

  (def arr @[])
  (def str "lol")

  (eachk i str (array/push arr [i (get str i)]))

  arr
  # =>
  @[[0 108] [1 111] [2 108]]

  )

# keys for tuple/array are 0-based index
# prints 0 1 2 3 4
(eachk i [:a :b :c :d :e] (prin i " ")) # -> nil

# prints 0 1 2 3 4
(eachk i @["a" "b" "c" "d" "e"] (prin i " ")) # -> nil

# prints keys in table/struct in an unspecified order
# prints :b :a
(eachk k {:a 1 :b 2} (prinf "%v " k)) # -> nil

(comment

  (def arr @[])

  (eachk [_ j] {[:a 0] :x [:b 1] :y} (array/push arr j))

  arr
  # =>
  @[0 1]

  )

