```
    janet_quick_asm(env, JANET_FUN_NEXT,
                    "next", 2, 1, 2, 2, next_asm, sizeof(next_asm),
                    JDOC("(next x &opt key)\n\n"
                         "Gets the next key in `x`. Can be used to iterate through "
                         "the keys of `x` in an unspecified order. Keys are guaranteed "
                         "to be seen only once per iteration if `x` is not mutated "
                         "during iteration. If `key` is `nil`, returns the first key. "
                         "If `nil` is returned, there are no more keys to iterate "
                         "through.\n"
                         "\n"
                         "`x` can be a bytes, indexed, dictionary, fiber, or abstract "
                         "type with a `next` method."));
```

(comment

  (next "hi")
  # =>
  0

  (next "hi" 0)
  # =>
  1

  (next "hi" 1)
  # =>
  nil

  (next @"hello" 2)
  # =>
  3

  (next 'hello 3)
  # =>
  4

  (next :hello 4)
  # =>
  nil

  )

(comment

  (next [:bill :ted] 0)
  # =>
  1

  (next @[:ant :bee] 0)
  # =>
  1

  (next @[:ant :bee] 1)
  # =>
  nil

  )

(comment

  (next {:length 20 :width 30})
  # =>
  :length # or :width

  (next @{:x 5 :y 12})
  # =>
  :x # or :y

  (next @{:x 5 :y 12} :x)
  # =>
  :y # or nil

  (next @{:x 5 :y 12} :y)
  # =>
  nil # or :x

  )

(comment

  (def fib (coro (yield :a) (yield :b)))

  (next fib)
  # =>
  0

  (next fib)
  # =>
  0

  (next fib)
  # =>
  nil

  )

