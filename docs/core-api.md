# Guidelines for Core API Examples

The following are evolving guidelines for the construction of Core API
examples.  Taking a look at the [Core API
page](https://janet-lang.org/api/index.html) while going through the
following is likely to help with interpreting the content.  It may be
good to discuss existing or missing points.

For some background information, see [this summary of the Janetuary
2025
activity](https://github.com/sogaiu/janet-examples/blob/53c79048fe69bd655151dedfb5d238c49cc0cb74/doc/janetuary-examples-2025.md)
which involved community members adding examples.

## Content

* Focus on intended usages

  At this point, it seems more useful if what's on the Core API page
  can be a strong hint that some type of usage is intended.  A
  stronger sign may be the case where there is a test in the janet
  repository.  Documenting unintended usages might be useful at some
  point, but it's unclear at this point how to do that well.  Filing
  an issue is probably a better way to track such cases for discussion
  and revisiting later.

* Try to exhibit unexpected / surprising (but intended) edge cases

  This may help document "gotchas".  Check the docstring, look at the
  implementation, and/or ask for clarification regarding intention.

* Try to make short and illustrative examples

  It's not always practical to do this, but it may be worth trying
  initially.  Note that as fun as it can be, we're not code golfing
  here.

* Use brief comments to explain if needed

  Comments can also be used to indicate that an error is expected,
  some output occurs on standard output, call out some surprising
  aspect, clarify some points, etc.

## Format

* Use `# ->` followed by return values to show evaluation results

  Though it's not always possible, it is nicer if the return value is
  copy-pastable into a repl.  Square brackets can be used toward this
  end to show tuple values.  Single quotes in appropriate locations
  can also help sometimes.  View the existing examples on the Core API
  to get a sense of what to do.

* Try to be wary of line lengths

  Due to reasons (TM), longer lines don't render so well on narrower
  screens such as those on phones and [the current rendering may not
  be so easy to
  change](https://github.com/janet-lang/janet-lang.org/issues/340).  A
  sense of what works and what doesn't can be gotten by browsing the
  Core API on a suitable device.

* Don't end an example file with an empty line

  Currently, this will lead to rendering of a blank line that looks
  out of place.

## Misc

These points are recorded here for reference.  They are mostly
reminders.

* Indicating errors and output (e.g. to standard output or standard
  error) doesn't yet have a uniform convention.  Might be good to
  discuss.

* Some evaluation results may differ for different users or when
  done at different times because some aspects of things are
  not "pure":

  * dictionary key-value order
  * randomness
  * I/O (including network)
  * time

* Where and how to record usages where it's unclear from the
  docstring if it's intended.  Some of that information lives in
  this repository already, so continuing to add to what's here is
  one possibility.
