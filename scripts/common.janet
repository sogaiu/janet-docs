(defn parse-ds
  [input]
  (def lines (string/split "\n" input))
  (var n 0)
  # skip first blank lines
  (while (def line (get lines n))
    (when (< 0 (length line))
      (break))
    (++ n))
  # find what type of thing is being described
  (def what (string/trim (get lines n)))
  (++ n)
  (def line (get lines n))
  # if there is a location, save it
  (def location
    (when (< 0 (length line))
      (++ n)
      (string/trim line)))
  (assertf (= 0 (length (get lines n)))
           "expected empty line, got: %s"
           (get lines n))
  # move along
  (++ n)
  # if there is a signature, save it
  (def sig
    (when (get (invert ["function" "cfunction" "macro"]) what)
      (def _line (get lines n))
      (++ n)
      (string/trim _line)))
  # everything else is the body
  # find first non-empty line
  (var i n)
  (while (def _line (get lines i))
    (when (not (empty? _line))
      (break))
    (++ i))
  # find last non-empty line
  (var j (dec (length lines)))
  (while (def _line (get lines j))
    (when (not (empty? _line))
      (break))
    (-- j))
  # don't keep trailing lines
  (def body-lines (array/slice lines i (inc j)))
  #
  @{:what what
    :location location
    :sig sig
    :body body-lines})

(defn get-ds
  [name]
  (def buf @"")
  (with-dyns [*out* buf *doc-color* false]
    (doc* (symbol name)))
  #
  buf)

(defn parse-sig
  [sig-str]
  (def p (parse sig-str))
  (array/slice (flatten p) 1))

########################################################################

# XXX: weed out or change docstring:
#
#      * things with <sym> like bits?
#      * ... within janet fragment: @[k v k v k v ...]
#
# XXX: what to do about core/channel, core/native, etc.?

(defn path-ish?
  [item]
  # e.g. <stdio.h>
  (when (and (string/has-prefix? "<" item)
             (string/has-suffix? ">" item)
             (string/find "." item))
    (break true))
  # e.g. janetconf.h
  (= 1 (length (string/find-all "." item))))

(comment

  (path-ish? "janetconf.h")
  # =>
  true

  (path-ish? "<stdio.h>")
  # =>
  true

  (path-ish? "tmp")
  # =>
  false

  )

(defn c-flag-name-ish?
  [item]
  (truthy? (and (= item (string/ascii-upper item))
                # should have at least 1 _
                (not (nil? (string/find "_" item)))
                (peg/find '(range "AZ") item)
                # rule out plain _
                (< 1 (length item)))))

(comment

  (c-flag-name-ish? "_")
  # =>
  false

  # XXX: should this be ok?
  (c-flag-name-ish? "IN_*")
  # =>
  true

  (c-flag-name-ish? "FILE_SHARE_READ")
  # =>
  true

  (c-flag-name-ish? "M")
  # =>
  false

  (c-flag-name-ish? "TZ")
  # =>
  false

  (c-flag-name-ish? "<=")
  # =>
  false

  )

(defn env-var-name-ish?
  [item]
  (truthy? (and (= item (string/ascii-upper item))
                (peg/find '(range "AZ") item)
                # rule out single character strings
                (< 1 (length item)))))

(comment

  (env-var-name-ish? "TZ")
  # =>
  true

  (env-var-name-ish? "<=")
  # =>
  false

  )

(defn c-func-name-ish?
  [item]
  (truthy? (and (peg/find '(sequence "()" -1) item)
                (= item (string/ascii-lower item)))))

(comment

  (c-func-name-ish? "stat()")
  # =>
  true

  (c-func-name-ish? "_tzset()")
  # =>
  true

  (c-func-name-ish? "sprintf")
  # =>
  false

  )

(defn blacklist?
  [item]
  # mixed case should not occur: e.g. bInheritHandle
  (when (and (peg/find '(range "AZ") item)
             (peg/find '(range "az") item))
    (break true))
  #
  # certain uses of commas: e.g. [seconds, nanoseconds]
  (when (or (peg/find '(sequence "," :s) item)
            (peg/find '(sequence :a "," :a) item))
    (break true))
  # certain uses of colons: e.g. :all:
  (when (and (string/has-prefix? ":" item)
             (string/has-suffix? ":" item))
    (break true))
  # c array / indexing: e.g. arg[0]
  (when (peg/find '(sequence 1 :S "[") item) # let @[...] through
    (break true))
  # use of capital letter
  (when (peg/find '(range "AZ") item)
    (break true))
  #
  false)

(comment

  (blacklist? "bInheritHandle")
  # =>
  true

  (blacklist? "[seconds, nanoseconds]")
  # =>
  true

  (blacklist? ":all:")
  # =>
  true

  (blacklist? "argv[0]")
  # =>
  true

  (blacklist? "A")
  # =>
  true

  )

(defn classify
  [item]
  (when (path-ish? item)
    (break :path-ish))
  #
  (when (c-flag-name-ish? item)
    (break :c-flag-name-ish))
  #
  (when (env-var-name-ish? item)
    (break :env-var-name-ish))
  #
  (when (c-func-name-ish? item)
    (break :c-func-name-ish))
  #
  (when (blacklist? item)
    (break :blacklist))
  #
  (def [ok? vals] (protect (parse-all item)))
  (when (not ok?)
    (break :parse-fail))
  #
  (when (< 1 (length vals))
    (break :multiple-items))
  #
  (type (first vals)))

