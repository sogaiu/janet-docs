```
(defn thaw
  ``
  Given `x`, recursively create and return a mutable version, making
  child values also mutable. Any dictionaries will have their
  prototypes flattened. Only strings, indexed types, and dictionaries
  are processed, all other types are left untouched.
  ``
  [x]
  (case (type x)
    :array (walk-ind thaw x)
    :tuple (walk-ind thaw x)
    :table (walk-dict thaw (table/proto-flatten x))
    :struct (walk-dict thaw (struct/proto-flatten x))
    :string (buffer x)
    x))
```

(comment

  (thaw "str")
  # =>
  @"str"

  (thaw @"buf")
  # =>
  @"buf"

  (thaw 'sym)
  # =>
  'sym

  (thaw :kwd)
  # =>
  :kwd

  )

(comment

  (thaw [:ant [:bee]])
  # =>
  @[:ant @[:bee]]

  (thaw @["hi" nil])
  # =>
  @[@"hi" nil]

  )

(comment

  (thaw {:a {:b 2}})
  # =>
  @{:a @{:b 2}}

  (thaw @{:x [0 {:a ["hi" 1]}]})
  # =>
  @{:x @[0 @{:a @[@"hi" 1]}]}

  (def key [:hi])
  (def value [0 {:a ["hi" 1]}])
  (def tab @{key value})
  (def thawed (thaw tab))
  (def new-key (first (keys thawed)))

  (tuple? key)
  # =>
  true

  (array? new-key)
  # =>
  true

  (deep= new-key (array ;key))
  # =>
  true

  )

(comment

  (thaw nil)
  # =>
  nil

  (thaw true)
  # =>
  true

  (thaw 2.71828)
  # =>
  2.71828

  )

