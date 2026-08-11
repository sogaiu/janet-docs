````
(defmacro loop
  ```
  A general purpose loop macro. This macro is similar to the Common
  Lisp `loop` macro, although intentionally much smaller in scope.
  The head of the loop should be a tuple that contains a sequence of
  either bindings or conditionals. A binding is a sequence of three
  values that define something to loop over. Bindings are written in
  the format:

      binding :verb object/expression

  where `binding` is a binding as passed to def, `:verb` is one of a
  set of keywords, and `object` is any expression. Each subsequent
  binding creates a nested loop within the loop created by the
  previous binding.

  The available verbs are:

  * `:iterate` -- repeatedly evaluate and bind to the expression while
    it is truthy.

  * `:range` -- loop over a range. The object should be a two-element
    tuple with a start and end value, and an optional positive
    step. The range is half open, [start, end).

  * `:range-to` -- same as :range, but the range is inclusive [start,
    end].

  * `:down` -- loop over a range, stepping downwards. The object
    should be a two-element tuple with a start and (exclusive) end
    value, and an optional (positive!) step size.

  * `:down-to` -- same as :down, but the range is inclusive [start,
    end].

  * `:keys` -- iterate over the keys in a bytes, indexed, dictionary,
    fiber, or abstract type with suitable `next` method.

  * `:pairs` -- iterate over the key-value pairs as tuples in a bytes,
    indexed, dictionary, fiber, or abstract type with suitable `get`
    and `next` methods.

  * `:in` -- iterate over the values in a bytes, indexed, dictionary,
    fiber, or abstract type with suitable `get` and `next` methods.

  `loop` also accepts conditionals to refine the looping
  further. Conditionals are of the form:

      :modifier argument

  where `:modifier` is one of a set of keywords, and `argument` is
  keyword-dependent.  `:modifier` can be one of:

  * `:while expression` -- breaks from the current loop if
    `expression` is falsey.

  * `:until expression` -- breaks from the current loop if
    `expression` is truthy.

  * `:let bindings` -- defines bindings inside the current loop as
    passed to the `let` macro.

  * `:before form` -- evaluates a form for a side effect before the
    next inner loop.

  * `:after form` -- same as `:before`, but the side effect happens
    after the next inner loop.

  * `:repeat n` -- repeats the next inner loop `n` times.

  * `:when condition` -- only evaluates the current loop body when
    `condition` is truthy.

  * `:unless condition` -- only evaluates the current loop body when
    `condition` is falsey.

  The `loop` macro always evaluates to nil.
  ```
  [head & body]
  (loop1 body head 0))
````
