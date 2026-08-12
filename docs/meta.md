# Section on Janet's Website about Documentation

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
    from site prose as well as content from Core API page

    Understanding gained in this or similar manner can help with
    making better use of docstrings and Janet's source code.

  * Visit and use the Core API page

    * Single page searching across docstrings and examples is
      possible.

    * Examples are still sparse, but as we learn better what the
      intent for the behaviors of the existing functions, macros,
      etc. are we can add examples that reflect intended use.

  * There should be a glossary that lives as part of the website docs

    A glossary should help with looking up concepts and related terms
    as well as a way to browse such things.

    See [janet-glossary
    repository](https://github.com/sogaiu/janet-glossary) for a rough
    starting document.

* Current State

  * Docstrings need review and refinement

    In some cases, clarification about intended behavior will be
    needed.  It may be a good idea to update the website doc prose to
    increase consistency with docstrings.

  * Core API examples lacking

    As docstrings are reviewed and/or refined, examples should be
    added to / updated if needed.  If along the way, intent for some
    usage is clarified, it may also be good to ensure there are some
    correspomding tests in the janet repository.

  * Some website content may be missing or underdeveloped

    The following topics may not yet be covered enough or at all:

    * functions in value.c that implement `next`, `get`, etc.
    * abstract types - see [this collection of
      links](https://github.com/sogaiu/janet-abstract-type-notes) for
      some existing info
    * [inttypes](https://github.com/janet-lang/janet-lang.org/issues/356)
    * [Janet bundles](https://github.com/janet-lang/janet-lang.org/issues/312)
    * [janet-pm](https://janet.zulipchat.com/#narrow/channel/493321-janet-pm/topic/docs.20on.20the.20website.3F/near/614981340)
    * glossary - relevant concepts and terms need to be identified,
      recorded, and presented appropriately; see [earlier
      link](https://github.com/sogaiu/janet-glossary) for some earlier
      incomplete work
