```
    janet_quick_asm(env, JANET_FUN_GET,
                    "get", 3, 2, 3, 4, get_asm, sizeof(in_asm),
                    JDOC("(get x key &opt dflt)\n\n"
                         "Get the value mapped to `key` in `x`. Returns `dflt` "
                         "or `nil` if `key` is not found. Similar to `in`, but "
                         "will not throw an error if `key` is invalid for `x`. "
                         "However, if `x` is an abstract type, its getter may "
                         "throw an error.\n"
                         "\n"
                         "`x` can be a bytes, indexed, dictionary, fiber, or "
                         "abstract type with a `get` method."));
```

(comment

  (get "hello" 2)
  # =>
  108

  (get @"hello" 2)
  # =>
  108

  (get 'hello 3)
  # =>
  108

  (get :hello 3)
  # =>
  108

  (get :hello 8)
  # =>
  nil

  (get :hello 8 11)
  # =>
  11

  (get [:bill :ted] 1)
  # =>
  :ted

  (get @[:ant :bee] 0)
  # =>
  :ant

  (get @[:ant :bee] 2)
  # =>
  nil

  (get @[:ant :bee] 2 :fox)
  # =>
  :fox

  (get {:length 20 :width 30} :width)
  # =>
  30

  (get @{:x 5 :y 12} :y)
  # =>
  12

  (get @{:x 5 :y 12} :z)
  # =>
  nil

  (get @{:x 5 :y 12} :z -1)
  # =>
  -1

  (def fib (coro (yield :a) (yield :b)))

  (get fib 0)
  # =>
  nil

  (resume fib)
  # =>
  :a

  (get fib 0)
  # =>
  :a

  (get fib 0)
  # =>
  :a

  (get fib 1 :oops)
  # =>
  :oops

  (resume fib)
  # =>
  :b

  (get fib 0)
  # =>
  :b

  (resume fib)
  # =>
  nil

  (get fib 0)
  # =>
  nil

  )

