# Guidelines for Core API Examples

The following are evolving guidelines for the construction of Core API
examples.

Taking a look at the [Core API
page](https://janet-lang.org/api/index.html) while going through the
guidelines may help with developing a better understanding.

For the interested, [this summary of the Janetuary 2025
activity](https://github.com/sogaiu/janet-examples/blob/53c79048fe69bd655151dedfb5d238c49cc0cb74/doc/janetuary-examples-2025.md)
has some details of a previous community effort.

## Content

* Try to make brief illustrative examples

  Help develop understanding via examination, evaluation, and/or
  cross-referencing with website prose and docstrings.

* Focus on intended usages

  Help users avoid relying on unintended behavior that might change in
  the future.  If fewer to no users rely on unintended behavior, some
  desirable changes may be less problematic to make.

* Try to exhibit surprising (but intended) cases

  Help raise awareness and refine understanding of details and
  gotchas.

* Use brief comments to explain if needed

  Help better illustrate with additional prose, e.g. show that an
  error is expected, some output occurs on standard output, call out
  surprises, clarify, etc.

## Format

* Use `# ->` followed by return values to show evaluation results

  Though it's not always possible, it is nicer if the return value is
  copy-pastable into a repl.  Square brackets can be used toward this
  end to show tuple values.  Single quotes in appropriate locations
  can also help sometimes.  View the existing examples on the Core API
  page to get a sense of what to do.

* Try to be wary of line lengths

  Longer lines don't render so well on narrower screens such as those
  on phones and [the current rendering may not be so easy to
  change](https://github.com/janet-lang/janet-lang.org/issues/340).
  By browsing on a suitable device, one can get a sense of what works
  and what doesn't.

* Don't end an example file with an empty line

  Currently, this will lead to rendering of a blank line that looks
  out of place.

## Misc

These points are recorded here for reference.  They are mostly
reminders.

* Indication of errors and output (e.g. to standard output or standard
  error) don't yet have uniform conventions.

* Some evaluation results may differ for different users or when
  done at different times because some aspects of things are
  not "pure":

  * dictionary key-value order
  * randomness
  * I/O (including network)
  * time
  * platform

* Where and how to record unintended usages?  Some of that information
  lives in this repository already, so continuing to add to what's
  here is one possibility.
