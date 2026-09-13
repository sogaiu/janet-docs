```
JANET_CORE_FN(cfun_debug_break,
              "(debug/break source line col)",
              "Sets a breakpoint in `source` at `line` and `col`. Throws an "
              "error if the breakpoint location cannot be found. For example\n\n"
              "\t(debug/break \"core.janet\" 10 4)\n\n"
              "will set a breakpoint at line 10, 4th column of the file core.janet.") {
```

```
# needed to get debugger prompt
(setdyn :debug true)

(def source "f.janet")

(spit source
      ``
      (defn f
        [x]
        (- x 0)
        (+ x 1))
      ``)

(import ./f :prefix "")

# convenient to set breakpoint at entry to function
(debug/fbreak f)

# col 1 will not work and no error will be raised
(debug/break source 3 1)

# line 10 will not work and no error will be raised
(debug/break source 10 1)

# this should work
(debug/break source 3 3)

# should enter debugger
(f 1)

# list details, show breakpoints, etc.
(.ppasm)

# exit debugger
(quit)

# clean up
(os/rm source)
```

