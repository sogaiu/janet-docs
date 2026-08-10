# Janet Documentation

Some notes and scratch work on Janet documentation.

## Section on Janet's Website about Documentation?

It may be beneficial to community members to have a section on the
website that gives hints about how the documentation might be better
approached, used, and/or maintained.  Perhaps surprisingly, it's not
necessarily obvious.

* Rationale: To make certain points explicit to aid the following
  aspects of Janet's documentation (website docs and docstrings):

  * Expectations
  * Usage
  * Maintenance (communication, actions, decision-making, etc.)

* Constraints and Goals

  * Docstrings and website content should be considered maintainable
    by bakpakin.  At least for the moment, he is the most likely
    individual to be around to look after things.

  * Docstrings should not contain examples / tutorial-like material:

    * https://github.com/janet-lang/janet/commit/5de889419ff26b710b706958bf99e180d084f564

  * Related to previous point, size is a consideration:

    * https://github.com/janet-lang/janet/pull/1789#issuecomment-5160523840

  * Aim for correctness of docstrings and express using some
    background knowledge obtainable from the website docs prose.

    As an example, the terms "bytes type", "indexed type", and
    "dictionary" are all defined clearly on the data structures
    page (as well as being referred to in janet.h).

    Docstrings may not be the place to be learning certain kinds of
    basic information about Janet.

  * Website should be improved to contain sufficient information to
    act as background for docstrings.

  * Core API page should have examples of intended usage; unintended
    usages should not be shown, though documenting such things in
    issues may be a good idea.

  * Aim for consistency among website docs, docstrings, Core API
    examples.

* Eventual Recommended Use of Janet Documentation

  * Read website docs and type in and experiment with examples both
    from main text as well as content from Core API page.
    Understanding gained in this or similar manner can help with
    making better use of docstrings and Janet's source code.

  * Visit and use the Core API page.

    * Single page searching across docstrings and examples is
      possible.

    * Examples are still sparse, but as we learn better what the
      intent for the behaviors of the existing functions, macros,
      etc. are we can add examples that reflect intended use.

  * Eventually there should be a glossary that lives as part of the
    website docs (see [janet-glossary
    repository](https://github.com/sogaiu/janet-glossary) for a rough
    starting document).  A glossary should help with looking up
    concepts and related terms as well as a way to browse such things.

* Current State

  * Docstrings need review and refinement; in some cases,
    clarification about intended behavior will be needed.  It may be a
    good idea to update the website doc prose to increase consistency
    with docstrings.

  * Core API examples lacking; as docstrings are reviewed and/or
    refined, examples should be added to / updated.  If along the way,
    intent for some usage is clarified, it may be good to ensure there
    is at least one test in the janet repository to reflect the
    intent.

  * Glossary page does not exist yet; relevant concepts and terms
    need to be identified, recorded, and presented appropriately.

## Guidelines for Core API Examples

The following are evolving guidelines for the construction of Core API
examples.  It may be good to discuss existing or missing points.

* Focus on intended usages.

  At this point, it seems more useful if what's on the Core API page
  can be a strong hint that some type of usage is intended.  A
  stronger sign may be the case where there is a test in the janet
  repository.  Documenting unintended usages might be useful at some
  point, but it's unclear at this point how to do that well.  Filing
  an issue is probably a better way to track such cases for discussion
  and revisiting later.

* Try to exhibit unexpected / surprising (but intended) edge cases.

  This may help document "gotchas".  Check the docstring, look at the
  implementation, and/or ask for clarification regarding intention.

* Try to make short and illustrative examples.

  It's not always practical to do this, but it may be worth trying
  initially.  Note that as fun as it can be, we're not code golfing
  here.

* Try to be wary of line lengths.

  Due to reasons (TM), longer lines don't render so well on narrower
  screens such as those on phones and [the current rendering may not
  be so easy to
  change](https://github.com/janet-lang/janet-lang.org/issues/340).  A
  sense of what works and what doesn't can be gotten by browsing the
  Core API on a suitable device.

* Use `# ->` followed by return values to show evaluation results.
  
  Though it's not always possible, it is nicer if the return value is
  copy-pastable into a repl.  Square brackets can be used toward this
  end to show tuple values.  Single quotes in appropriate locations
  can also help sometimes.  View the existing examples on the Core API
  to get a sense of what to do.

* Use brief comments to explain if needed.

  Comments can also be used to indicate that an error is expected,
  some output occurs on standard output, etc.

* Don't end an example file with an empty line.

  Currently, this will lead to rendering of a blank line that looks
  out of place.

* Less clear points:

  * Indicating errors and output (e.g. to standard output or standard
    error) doesn't yet have a uniform convention.  Might be good to
    discuss.

  * Where and how to record usages where it's unclear from the
    docstring if it's intended.

## Guidelines for Docstrings

* Try to use terms that have clear definitions on the website
  (eventually the glossary).  Some examples include:

  * bytes type - string, buffer, symbol, or keyword
  * indexed type - tuple or array
  * dictionary - struct or table
  * fiber

  An exception might be "data structure".  This term seems to have a
  clear definition, but in practice it doesn't seem to be turning out
  to be all that useful.  In Janet, it appears to mean bytes, indexed,
  or dictionary type, but since it seems to leave out fibers and/or
  abstract types, it hasn't ended up being that useful in docstrings
  because there seem to be very few situations where both fibers and
  abstract types are excluded and only "data structures" are meant.

* Some terms that don't appear to have clear definitions include
  (and we're trying to avoid mostly):

  * collection - according to the data structures page, strings are
    data structures...but are they collections?  There is no good
    answer in Janet at the moment and it may not be worth the effort
    to try to force a definition, i.e. existing clearer terms might
    turn out to be good enough.  Hopefully, this will become clearer
    in the near future.

  * <...> data structure - "indexed", "nested", "associative", etc.
    are unfortunately not consistently used and we're in the midst of
    removing these uses and favoring instead spelling things out a bit
    more explicitly (e.g. using "bytes and indexed types") based on
    the more clearly defined terms.  Note that it's as yet, unclear
    whether fibers and abstract types count as "data structures".

* Try to be wary of line lengths.  Long line lengths can make doing
  side-by-side comparisons harder.  It appears to be fairly
  well-established that people's reading comprehension can be
  adversely affected when lines are too long.  Peripheral vision,
  horizontal eye-tracking, and chunking of items per line all suffer
  as well.

  It might feel more comfortable when writing and there is something
  to be said for more lines fitting on a single screen (since the
  entirety of something is more likely to fit, though if things spread
  out too much sideways, things are not going to be as viewable
  either), but the prose is going to be read and reviewed far more
  frequently.  Consider trying to choose shorter words.

