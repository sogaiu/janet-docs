# Parameter Names in `boot.janet`

There is some degree of reuse among parameter names in `boot.janet`.
After reviewing, possibly usages might be made more consistent.

## Potential for Convention

* args - as-macro, maclintf, errorf, assertf, extreme, max, min,
  max-of, min-of, update-in, update, require, import*, import,
  ev/call, cli-main

* binding - with, when-with, if-with

* bindings - let, if-let, when-let, with-dyns

* body - when, unless, let, protect, try, with-syms, defer, edefer,
  prompt, label, with, when-with, forv, for, eachk, eachp, repeat,
  forever, each, loop, seq, catseq, generate, coro, fiber-fn,
  when-let, with-dyns, with-env, with-vars, varfn, compwhen, ev/spawn,
  ev/do-thread, ev/with-lock, ev/with-rlock, ev/with-wlock,
  ev/spawn-thread, ev/with-deadline, ffi/defbind-alias, ffi/defbind

* dict - kvs

* dicts - merge-into, merge

* env - with-env, eval, eval-string, make-image, debugger-on-status,
  dofile, all-bindings, all-dynamics, repl

* f - sort-by, sorted-by, ev/call

* fmt - maclintf, errorf, assertf

* form - defer, edefer, walk, postwalk, prewalk, eval

* forms - and, or, ->, ->>, -?>, -?>>, as->, as?->, delay

* funs - juxt*, fuxt

* head - loop, seq, catseq, tabseq, generate

* ind - sorted, sorted-by, flatten-into, flatten

* init - varglobal, reduce, accumulate

* key - has-key?, update

* ks - zipcoll, get-in, update-in, put-in

* more - defn, defmacro, defmacro-, defn-, def-, var-, defdyn

* name - defn, defmacro, defmacro-, defn-, def-, var-, defglobal,
  varglobal, label, varfn, ffi/defbind-alias, ffi/defbind

* n - repeat, take, drop, partition

* ns - +=, -=, *=, /=, %=

* path - slurp, spit, module/add-syspath, module/find, dofile,
  require, import*, import, flycheck

* pred - filter, count, keep, find-index, find, take-until,
  take-while, drop-until, drop-while, all, some

* tab - merge-into

* str - parse, parse-all, eval-string, doc-format

* sym - default, module/value, doc*, doc

* syms - with-syms

* x - nan?, number?, fiber?, string?, symbol?, keyword?, buffer?,
  function?, cfunction?, table?, struct?, array?, tuple?, boolean?,
  truthy?, true?, false?, nil?, empty?, odd?, idempotent?, assert,
  assertf, comptime, sort-by

* xs - compare*, (all, count, keep, map, mapcount, some [1])

[1] Intending to use `xs` before too long.

## Potential for Unification

### condition vs cnd

* condition - if-not, when, unless
* cnd - compif, compwhen

### val vs value

* val - default
* value - toggle, defglobal, return, has-value?, quit

I didn't realize that `val` and `value` had been used and introduced
`v` for `put-in`.  This should probably be eliminated in favor of
one of the other two.

### fal vs vs falsey vs fals

* fal - if-let
* falsey - if-with
* fals - compif

## Shadowing?

Doesn't actually shadow due to order:

* pairs - cond, case
