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

* Goals

  * Website should be improved to contain sufficient information to
    act as background for docstrings.

  * Core API page should have examples of intended usage to be viewed
    along with docstrings.

  * Aim for consistency among website docs, docstrings, and Core API
    examples.

  * All aforementioned components need to remain maintainable by
    bakpakin.

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
examples.  Taking a look at the [Core API
page](https://janet-lang.org/api/index.html) while going through the
following is likely to help with interpreting the content.  It may be
good to discuss existing or missing points.

For some background information, see [this summary of the Janetuary
2025
activity](https://github.com/sogaiu/janet-examples/blob/53c79048fe69bd655151dedfb5d238c49cc0cb74/doc/janetuary-examples-2025.md)
which involved community members adding examples.

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
  some output occurs on standard output, call out some surprising
  aspect, clarify some points, etc.

* Don't end an example file with an empty line.

  Currently, this will lead to rendering of a blank line that looks
  out of place.

* Less clear points:

  * Indicating errors and output (e.g. to standard output or standard
    error) doesn't yet have a uniform convention.  Might be good to
    discuss.

  * Some evaluation results may differ for different users or when
    done at different times because not everything is a pure function
    (e.g. time-related things, dictionary key order is unspecified,
    etc.).

  * Where and how to record usages where it's unclear from the
    docstring if it's intended.  Some of that information lives in
    this repository already, so continuing to add to what's here is
    one possibility.

## Guidelines for Docstrings

The following are the start of some notes on docstring construction.
As with the guidelines for examples, taking a look at some specific
items (in this case, docstrings, say, on the Core API page) while
reading the points below may help with arriving at a decent
understanding.  Having said that, the guidelines here are much less
developed than those for the Core API examples.

To get an idea of some of the background for previous (and ongoing)
work on improving docstrings, please have a look at [some relevant
Zulip discussion starting around this
message](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janet.20Documentation.20Improvements/near/608185555).

* Docstrings [should not contain examples / tutorial-like
  material](https://github.com/janet-lang/janet/commit/5de889419ff26b710b706958bf99e180d084f564).

* Related to previous point, [size is a
  consideration](https://github.com/janet-lang/janet/pull/1789#issuecomment-5160523840).

* Aim for correctness of docstrings and express using some background
  knowledge obtainable from the website docs prose.

  As an example, the terms "bytes type", "indexed type", and
  "dictionary" are all defined clearly on the data structures page (as
  well as [being referred to in
  `janet.h`](https://github.com/janet-lang/janet/blob/4370ae8acc5f1141a241becb8b2a2badc75ac8fe/src/include/janet.h#L607-L609)).

  Docstrings may not be the place to be learning certain kinds of
  basic information about Janet.

  Try to use terms that have clear definitions on the website
  (eventually the glossary).  Some examples include:

  * bytes type - string, buffer, symbol, or keyword
  * indexed type - tuple or array
  * dictionary - struct or table
  * fiber

  An exception might be "data structure".  See below for more details.

* There are some terms which might be better to avoid, at least at
  first, e.g.:

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
    whether fibers and abstract types count as "data structures".  The
    term hasn't ended up being that useful in docstrings because there
    seem to be very few situations where both fibers and abstract
    types are excluded and only "data structures" are meant.

  * iterable - this is a term that does have a solid basis in the
    source code (via [an error message in `janet_next_impl` in
    `value.c`](https://github.com/janet-lang/janet/blob/4370ae8acc5f1141a241becb8b2a2badc75ac8fe/src/core/value.c#L134)),
    but it is not really used on the website docs ("iterate" and
    "iteration" are though).  An iterable is effectively something
    that `next` can handle.

    One issue with this term is that it hasn't turned out to be that
    useful in docstrings.  Specifically, there aren't that many
    docstrings where it is that relevant (though `empty?`'s docstring
    is an exception as it makes pretty good use of it).

    Another issue is that there are a number of other C functions in
    `value.c` which are arguably comparably relevant and yet those do
    not have analogous terms.  The functions in question include:

    * `janet_equals`
    * `janet_hash`
    * `janet_compare`
    * `janet_in`
    * `janet_get`
    * `janet_getindex`
    * `janet_length` (and may be `janet_lengthv`)
    * `janet_putindex`
    * `janet_put`

    None of these have a term like "iterable" associated with them.

    ATM, it seems that we might as well say something like "responds
    to `next`" or "has `get` support", particularly because there are
    a number of cases where we want to say that an abstract type that
    has implementations of more than one of associated methods
    (e.g. `get` and `next`) is relevant.

* Try to be wary of line lengths.

  Long line lengths can make doing side-by-side comparisons harder.
  It appears to be fairly well-established that reading comprehension
  can be adversely affected when lines are too long.  Peripheral
  vision, horizontal eye-tracking, and chunking of items per line are
  challenged as well.

  It might feel more comfortable when writing and there is something
  to be said for more lines fitting on a single screen (since the
  entirety of something is more likely to fit...though if things
  spread out too much sideways, things are not going to be as viewable
  either), but the prose is going to be read and reviewed far more
  frequently.  Consider trying to choose shorter words.

## Candidate Unofficial FAQ List

The following is a list of questions and answers (or links to answers)
that seemed worth collecting in one place.  It's a different sort of
list than the [one in the repository
README](https://github.com/janet-lang/janet/blob/4370ae8acc5f1141a241becb8b2a2badc75ac8fe/README.md#faq).

* How can I learn more about the background and goals of the project?

  * [Interview with
    bakpakin](https://alexalejandre.com/interviews/interview-with-bakpakin/) -
    relatively recent information courtesy of Alex Alejandre

  * [What are the goals of the Janet
    project?](https://github.com/janet-lang/janet/discussions/554) -
    older GitHub discussion started by Mike Beller

* Does Janet have contribution policies?

  * [CONTRIBUTING.md](https://github.com/janet-lang/janet/blob/master/CONTRIBUTING.md) -
    note the "Contributions from Automated Tools" and "LLMs, Tool
    Usage, and Transparency" sections

  * [Add LLM, AI and tool usage section to contribution
guide.](https://github.com/janet-lang/janet/pull/1730) - contains some
discussion as well as point about starting conservative

  * [Poll for Policy on AI contributions to
    Janet](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Poll.20for.20Policy.20on.20AI.20contributions.20to.20Janet/near/577653330) -
    this Zulip discussion contains remarks from various community
    members and might be worth going through to get a general sense of
    things

* Is there a recommended way to install janet and related bits without
  `sudo` (aka per-user / local install)?

  See the [Non-root install (macOS and
  Unix-like)](https://janet-lang.org/docs/index.html#Non-root-install-(macOS-and-Unix-like))
  instructions for compiling from source

* Are there any gotchas when using the binaries from GitHub releases
  for *nix systems?

  *nix prebuilt binaries from gh are ok for light testing but due to
  having `/usr/local/lib/janet` hard-wired in, ignore `PREFIX` and
  thus may require work to get working with certain setups.  See [this
  issue](https://github.com/janet-lang/jpm/issues/96) for some details
  and pointers.
  
  Since for *nix, it's pretty easy to build janet from source, if that
  works for your situation, it may be a simpler path.

* What are some resources for learning to use Janet?

  * [Janet website](https://janet-lang.org/docs/index.html) - official website

  * [Janet for Mortals](https://janet.guide) - @ianthehenry's book

* Should I use jpm, janet-pm, or something else?

  See the following:

  * [The future of janet package
    management](https://janet.zulipchat.com/#narrow/channel/409517-help/topic/.E2.9C.94.20The.20future.20of.20janet.20package.20management/near/571913584) -
    response from bakpakin

  * ["legacy" and "modern" bundles and tools ( jpm / jeep / janet-pm
    )](https://github.com/janet-lang/janet/discussions/1748#discussioncomment-16896519) -
    response from bakpakin

  * [Issue #1444](https://github.com/janet-lang/janet/issues/1444) -
    ATM, contrary to the issue's title, it's not looking like `jpm`
    will be re-integrated...however, a subset of functionality was
    brought into `janet` and other bits were spun-off into `spork` and
    evolved as `janet-pm`

* What sort of editor support is there?

  In short:

  * VSCode / VSCodium - vscode-janet-plus-plus
  * Emacs
  * Vim / Neovim
  * Helix
  * Other

  See [here](https://janet-lang.org/#Editor-Support) for some links.

* Where can I find codebases that use Janet?

  [Here](https://github.com/sogaiu/janet-examples) is a collection of
  relevant links.

* Where do Janeteers hang out?

  ATM, the most active may be the [Zulip
  instance](https://janet.zulipchat.com).

## Credits

The Janet community activity has informed this document, specifically
including (but not limited to):

* agent-kilo
* ahungry
* AlecTroemel
* amano-kenji
* andrewchambers
* andrewrothman
* Arteneko
* bakpakin
* brendanhowell
* cellularmitosis
* CFiggers
* cfoust
* cideM
* corasaurus-hex
* CosmicToast
* dmitrys99
* erichaney
* GrayJack
* greenfork
* gwegash
* HParker
* iacore
* ianthehenry
* iceghost
* ifreund
* jeannekamikaze
* kamisori
* kcjpop
* LeviSchuck
* llmII
* MikeBeller
* mpwillson
* oofoe
* paulsnar
* pepe
* pyrmont
* reym
* rwtolbert
* saikyun
* sarna
* strangepete
* subsetpark
* swalker
* taoeffect
* tionis
* uvtc
* veqqq
* wmealing
* yumaikas
* zevv

If I've forgotten to mention someone who wishes to be listed (or if
you want to be removed), please let me know!

