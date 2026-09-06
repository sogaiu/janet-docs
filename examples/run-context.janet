```
(defn run-context
  ``
  Run a context. This evaluates expressions in an environment, and
  encapsulates parsing, compilation, and evaluation. Takes a
  dictionary `opts` with the following options:

  * `:env` -- environment to compile against; default is the current
    environment.

  * `:chunks` -- callback to read into a buffer; default is `getline`.

  * `:on-status` -- callback when a value is evaluated; default is
    `debug/stacktrace`.

  * `:on-compile-error` -- callback when compilation fails; default
    is `bad-compile`.

  * `:on-compile-warning` -- callback for any linting error; default
    is `warn-compile`.

  * `:on-parse-error` -- callback when parsing fails; default is
    `bad-parse`.

  * `:fiber-flags` -- flags to wrap the compilation fiber with;
    default is `:ia`.

  * `:evaluator` -- callback that executes thunks; signature is
    `(evaluator thunk source env where)`.

  * `:source` -- source path for better errors (use keywords for
    non-paths); default is `:<anonymous>`.

  * `:parser` -- custom parser that implements the same interface as
    Janet's built-in parser.

  * `:read` -- function to get the next form; signature is `(read env
    source)`; overrides all parsing.

  * `:expander` -- function that is called on each top-level form
    before being compiled.

  Returns `(in env :exit-value env)` when complete.  
  ``
```

