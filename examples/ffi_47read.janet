```
JANET_CORE_FN(cfun_ffi_buffer_read,
              "(ffi/read ffi-type bytes &opt offset)",
              "Parse a native struct out of a bytes type and convert it "
              "to normal Janet value. This function is the inverse of "
              "`ffi/write`. `bytes` can also be a raw pointer, although "
              "this is unsafe.") {
    janet_sandbox_assert(JANET_SANDBOX_FFI_USE);
    janet_arity(argc, 2, 3);
    JanetFFIType type = decode_ffi_type(argv[0]);
    size_t offset = (size_t) janet_optnat(argv, argc, 2, 0);
    if (janet_checktype(argv[1], JANET_POINTER)) {
        uint8_t *ptr = janet_unwrap_pointer(argv[1]);
        return janet_ffi_read_one(ptr + offset, type, JANET_FFI_MAX_RECUR);
    } else {
        size_t el_size = type_size(type);
        JanetByteView bytes = janet_getbytes(argv, 1);
        if ((size_t) bytes.len < offset + el_size) janet_panic("read out of range");
        return janet_ffi_read_one(bytes.bytes + offset, type, JANET_FFI_MAX_RECUR);
    }
}
```

# XXX: "type" instead of "data structure" because the following types
#      can be returned...(i.e. not just "data structure"s)

# XXX: janet_ffi_read_one's source suggests that the following types
#      can be returned by ffi/read:
#
# * nil
# * array
# * tuple
# * number
# * pointer
# * string
# * boolean
# * s64
# * u64

