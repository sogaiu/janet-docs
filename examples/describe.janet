```
JANET_CORE_FN(janet_core_describe,
              "(describe x)",
              "Returns a string that is a human-readable description of "
              "`x`. For indexed, dictionary, fiber, function, cfunction, "
              "pointer, and some abstract types, the string returned "
              "contains a pointer value from which the identity of `x` "
              "can be determined.") {
    JanetBuffer *b = janet_buffer(0);
    for (int32_t i = 0; i < argc; ++i)
        janet_description_b(b, argv[i]);
    return janet_stringv(b->data, b->count);
```

# XXX: following also have pointer value:
#
# * fiber
# * function
# * cfunction
# * pointer

