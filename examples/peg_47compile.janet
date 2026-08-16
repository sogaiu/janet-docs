```
JANET_CORE_FN(cfun_peg_compile,
              "(peg/compile peg)",
              "Compiles `peg`, a source form, into a `<core/peg>`. This will "
              "speed up matching if the same peg is used multiple times. "
              "`(dyn :peg-grammar)` replaces `default-peg-grammar` for the "
              "grammar of the peg.") {
    janet_fixarity(argc, 1);
    JanetPeg *peg = compile_peg(argv[0]);
    return janet_wrap_abstract(peg);
}
```

(comment

  (peg/match (peg/compile :a) "J")
  # =>
  @[]

  (peg/match (peg/compile 1) "_")
  # =>
  @[]

  (peg/match (peg/compile '(any 1)) "")
  # =>
  @[]

  (peg/match (peg/compile ~{:main (some :line) :line (thru "\n")}) "!\n")
  # =>
  @[]

  (peg/match (peg/compile ~@{:main (* :h+ :ws :a+) :ws (set " \t")}) "0A Z")
  # =>
  @[]

  )

