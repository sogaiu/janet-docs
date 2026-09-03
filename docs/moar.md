# Ideas for More Janet Website Content

Some subjects lack appropriate coverage on the website.

The following are some ideas for things that might benefit from
additional content:

* About Janet documentation - see [this](./meta.md)
* Functions in janet's
  [`value.c`](https://github.com/janet-lang/janet/blob/ef69c8922138a89bcd546b8116af3229fd43b347/src/core/value.c)
  that implement `next`, `get`, etc. behavior
* Abstract types - see [this collection of
  links](https://github.com/sogaiu/janet-abstract-type-notes) for some
  existing info
* [inttypes](https://github.com/janet-lang/janet-lang.org/issues/356)
* [Janet
  bundles](https://github.com/janet-lang/janet-lang.org/issues/312)
* janet-pm
  * [Zulip topic message](https://janet.zulipchat.com/#narrow/channel/493321-janet-pm/topic/docs.20on.20the.20website.3F/near/614981340)
  * [janet-lang.org issue](https://github.com/janet-lang/janet-lang.org/issues/427)
* Negative index use
  * [Explain the logic behing negative slice
    indices](https://github.com/janet-lang/janet/pull/208)
  * [Negative index in array.remove off by one
    error?](https://github.com/janet-lang/janet/issues/1219)
  * [array/remove: update final array index to be
    -1](https://github.com/janet-lang/janet/pull/1224)
  * [update docstrings for string/slice and
    tuple/slice](https://github.com/janet-lang/janet/commit/c2e55b54869adafd59464900fd1b2d21600587df)
* Upgrading concerns
  * native modules may need to be recompiled
    * jpm
      * jpm clear-cache
      * jpm update-installed
  * `.jimage` files may need to be rebuilt
* Glossary - relevant concepts and terms need to be identified,
  recorded, and presented appropriately; see [this
  repository](https://github.com/sogaiu/janet-glossary) for some
  earlier incomplete work
