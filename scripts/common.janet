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
  (drop 1 (flatten p)))

