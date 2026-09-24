```
JANET_CORE_FN(cfun_tuple_slice,
              "(tuple/slice ind &opt start end)",
              "Returns a tuple based on a range of an indexed "
              "type `ind`. The range is specified by optional "
              "index arguments `start` and `end` defaulting to 0 "
              "and the length of `ind` respectively. When "
              "non-negative, `start` is inclusive and `end` is "
              "exclusive, i.e. [`start`, `end`), and their "
              "values can range from 0 through the length of "
              "`ind`. When negative, `start` is exclusive and "
              "`end` is inclusive, i.e. (`start`, `end`], and "
              "their values can range from the negative of one "
              "more than the length of `ind` through -1. If "
              "`start` or `end` is out of range, an error is "
              "raised.") {
```
