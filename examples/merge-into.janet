```
(defn merge-into
  ``
  Merges multiple dictionaries into table `tab`. If a key appears in
  more than one dictionary in `dicts`, then later values replace any
  previous ones. Returns `tab`.
  ``
  [tab & dicts]
  (loop [c :in dicts
         key :keys c]
    (put tab key (in c key)))
  tab)
```

(comment

  (merge-into @{:a 1} {:b 2})
  # =>
  @{:a 1 :b 2}

  (merge-into @{} @{:y 20} @{:x 20})
  # =>
  @{:x 20 :y 20}

  (merge-into @{} @{:plant :oak} {:fungi :shiitake})
  # =>
  @{:fungi :shiitake :plant :oak}

  )

