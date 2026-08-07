```
    janet_quick_asm(env, JANET_FUN_IN,
                    "in", 3, 2, 3, 4, in_asm, sizeof(in_asm),
                    JDOC("(in x key &opt dflt)\n\n"
                         "Get value in `x` at `key`. For bytes and indexed "
                         "types, `key` must be a non-negative interger in "
                         "bounds or an error is raised. For dictionaries "
                         "`key` must be a non-nil value and if not found, "
                         "will return `dflt` if provided or `nil` otherwise.\n"
                         "\n"
                         "`x` can be a bytes, indexed, dictionary, fiber, or "
                         "abstract type with a `get` method."));
```

(comment
		
  (in "hello" 2)
  # =>
  108
		
  (in @"hello" 2)
  # =>
  108
		
  (in 'hello 3)
  # =>
  108

  (in :hello 3)
  # =>
  108
		
  # errors since key out of bounds
  (protect
    (in :hello 8))
		
  # errors since key out of bounds
  (protect
    (in :hello 8 11))
		
  # errors since key not integer
  (protect
    (in :hello :key))

  )		

(comment
		
  (in [:bill :ted] 1)
  # =>
  :ted
		
  (in @[:ant :bee] 0)
  # =>
  :ant

  # errors since key out of bounds
  (protect
    (in @[:ant :bee] 2))
		
  # errors since key out of bounds
  (protect
    (in @[:ant :bee] 2 :fox))
		
  # errors since key not integer
  (protect
    (in @[:ant :bee] :key))

  )		

(comment
		
  (in {:length 20 :width 30} :width)
  # =>
  30
		
  (in @{:x 5 :y 12} :y)
  # =>
  12

  (in @{:x 5 :y 12} :z)
  # =>
  nil
		
  (in @{:x 5 :y 12} :z -1)
  # =>
  -1

  )		
		
(comment

  (def fib (coro (yield :a) (yield :b)))
		
  (in fib 0)
  # =>
  nil
		
  (resume fib)
  # =>
  :a
		
  (in fib 0)
  # =>
  :a
		
  (in fib 0)
  # =>
  :a

  # errors since unexpected key
  (protect
    (in fib 1 :oops))
		
  (resume fib)
  # =>
  :b
		
  (in fib 0)
  # =>
  :b
		
  (resume fib)
  # =>
  nil

  (in fib 0)
  # =>
  nil

  )

