########################################################################

# based on examples.janet from janet-lang.org repository

(def replacer
  (peg/compile
    ~(% (any (+ (/ '(set "%*/:<>?")
                   ,|(string "_" (0 $))) '1)))))

(defn sym-to-filename
  ``
  Convert a symbol to a filename. Certain filenames are not allowed on
  various operating systems.
  ``
  [fname]
  (string "jlo-examples/" ((peg/match replacer fname) 0) ".janet"))

########################################################################

(def overrides

[['accumulate
  '[f init x]
  ``
  Similar to `reduce`, but accumulates successive results of applying
  `f` into a new array. The last element in the array is what would be
  the return value from `reduce`. The `init` value is not added
  directly as the first value of the new array, i.e. the returned
  array will have the same number of elements as `x`.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``]
 #
 ['accumulate2
  '[f x]
  ``
  The 2-argument version of `accumulate`. Instead of taking an
  explicit initial value, the first value of `x` is used instead. If
  `x` is empty, returns an empty array.

  `x` can be a bytes, indexed, dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``]
 #
 ['all
  '[pred x & xs]
  ``
  Apply `pred` to values of `x`. Return true if all results are truthy;
  if any result is falsey, stop applying `pred` and return the result.

  Also functions variadically, i.e. takes additional arguments, with
  suitable changes to the arity of `pred`. `pred` is called with both
  values from `x` and additional arguments, and only as many times as
  the length of the shortest of `x` and each element of `xs`. If `x`
  or any element of `xs` is empty, returns true.

  `x` and elements of `xs` can be values of type bytes, indexed,
  dictionary, fiber, or abstract with suitable `get` and `next`
  methods.
  ``]
 #
 ['any?
  '[x]
  ``
  Evaluates to the last element of `x` if all preceding elements are
  falsey, `nil` if `x` is empty, or otherwise to the first truthy
  element.

  `x` can be a bytes, indexed. dictionary, fiber, or abstract type
  with suitable `get` and `next` methods.
  ``]
 ['array/insert
  '[arr at & xs]
  ``
  Insert all `xs` into array `arr` at index `at`.  `at` should be an
  integer between 0 and the length of `arr`, or if negative, `at` will
  index backwards from the end of `arr`, inserting after the index
  such that inserting at -1 appends to `arr`.  Returns the array.
  ``]
 ])

# process all overrides
(each [name sig docstr] overrides
  (def extra
    (when-let [fname (sym-to-filename name)]
      (when (= :file (os/stat fname :mode))
        (slurp fname))))
  (def sig-buf (buffer/push @"" ;(interpose " " sig)))
  (def docstr-with-sig (string/format "(%s %s)\n\n%s" name sig-buf docstr))
  (def full-docstr
    (if extra
      (string docstr-with-sig
              "\n\n"
              "Examples\n\n"
              "```"
              extra
              "```")
      docstr-with-sig))
  # override existing docstring
  (put-in root-env [name :doc] full-docstr))

