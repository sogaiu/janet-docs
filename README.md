# Janet Documentation

## Proposal: Have section on website about Janet's documentation

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

