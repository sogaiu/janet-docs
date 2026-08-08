```
(defn merge
  ``
  Merges multiple dictionaries into one new table. If a key appears in
  more than one dictionary in `dicts` then later values replace any
  previous ones.  Returns the new table.
  ``
  [& dicts]
  (def container @{})
  (loop [c :in dicts
         key :keys c]
    (put container key (in c key)))
  container)
```

(comment

  (merge {:a 1} {:b 2})
  # =>
  @{:a 1 :b 2}

  (merge @{:x 10} @{:y 20} @{:x 20})
  # =>
  @{:x 20 :y 20}

  (merge {:animal :fish} @{:plant :oak} {:fungi :shiitake})
  # =>
  @{:animal :fish :fungi :shiitake :plant :oak}

  )

# XXX: not particularly useful?
(comment

  (merge [:ant :bee :cat] [:fox nil :giraffe])
  # =>
  @{0 :fox 2 :giraffe}

  )

# XXX: not particularly useful?
(comment

  (merge "ant" "bee")
  # =>
  @{0 98 1 101 2 101}

  )

