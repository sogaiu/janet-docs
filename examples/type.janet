```
JANET_CORE_FN(janet_core_type,
              "(type x)",
              "Returns the type of `x` as a keyword. `x` is one of:\n\n"
              "* :number\n"
              "* :nil\n"
              "* :boolean\n"
              "* :fiber\n"
              "* :string\n"
              "* :symbol\n"
              "* :keyword\n"
              "* :array\n"
              "* :tuple\n"
              "* :table\n"
              "* :struct\n"
              "* :buffer\n"
              "* :function\n"
              "* :cfunction\n"
              "* :pointer\n\n"
              "or another keyword for an abstract type.") {
    janet_fixarity(argc, 1);
    JanetType t = janet_type(argv[0]);
    if (t == JANET_ABSTRACT) {
        return janet_ckeywordv(janet_abstract_type(janet_unwrap_abstract(argv[0]))->name);
    } else {
        return janet_ckeywordv(janet_type_names[t]);
    }
}
```
