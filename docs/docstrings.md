# Guidelines for Docstrings

The following are evolving guidelines for docstring construction.  As
with the guidelines for examples, taking a look at some specific items
(in this case, docstrings, say, on [the Core API
page](https://janet-lang.org/api/index.html)) while reading the points
below may help with arriving at a clearer understanding.

To get an idea of some of the background for previous (and ongoing)
work on improving docstrings, please have a look at [some relevant
Zulip discussion starting around this
message](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/Janet.20Documentation.20Improvements/near/608185555).

## Content

1. Docstrings should not contain examples / tutorial-like material

   Short examples can live on the Core API page and some longer form
   material can live in the website's main prose.

   See [this commit
   message](https://github.com/janet-lang/janet/commit/5de889419ff26b710b706958bf99e180d084f564)
   for some history.

2. Express with background knowledge and terms from the website prose

   Docstrings may not be a good place to be learning certain kinds of
   basic information about Janet.

   As an example of term use, the phrases "bytes type", "indexed
   type", and "dictionary" are all defined clearly on [the data
   structures
   page](https://janet-lang.org/docs/data_structures/index.html) (as
   well as [being referred to in
   `janet.h`](https://github.com/janet-lang/janet/blob/4370ae8acc5f1141a241becb8b2a2badc75ac8fe/src/include/janet.h#L607-L609)).
   In many cases it makes sense to use these terms instead of spelling
   things out, e.g. "bytes type" can be used in place of "strings,
   buffers, keywords, and symbols".

   Try to use terms that have clear definitions on the website
   (eventually the glossary as well).  Some examples include:

   * bytes type - string, buffer, symbol, or keyword
   * indexed type - tuple or array
   * dictionary - struct or table
   * fiber

   An exception might be "data structure".  See below for more details.

3. There are some terms which might be better to avoid

   Below are some terms under consideration:

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

## Size, Features, and Format

1. Size is a consideration

   Related to the point about not having tutorials or examples, please
   see [this PR
   comment](https://github.com/janet-lang/janet/pull/1789#issuecomment-5160523840).

2. Only use certain supported features of Janet docstrings

   At minimum, probably it makes sense to:

   1. First read the [brief official summary of supported
      features](https://janet-lang.org/docs/documentation.html#Formatting-with-Markdown).
      It's a bit light on the details, but is a good short starting
      point.

   2. Next browse [this repository summarizing some existing usage of
      Janet docstring
      features](https://github.com/sogaiu/janet-docstring-notes).  It
      contains [this
      section](https://github.com/sogaiu/janet-docstring-notes/blob/30eda4a97e0d9b49e56e4b7696849ab5fa298421/README.md#in-janet-itself)
      which summarizes which features are used in the docstrings found
      in the janet repository itself.  Not all features are used and it
      probably makes sense to stick with the subset in use.

   If curious about past discussions, have a look at [this
   issue](https://github.com/janet-lang/janet-lang.org/issues/335).
   It's quite long and detailed though with no real conclusion.

   There is a [prototype tool to check
   docstrings](https://github.com/sogaiu/jdcheck) for compliance:

   > It detects various features and reports if it finds features that
   > are known not to be supported by `doc-format`.

   There haven't been any 3rd party use reports so YMMV.

3. Use one space after a grammatical period (full stop)

   Most of the existing docstrings do not use more than one space
   character after a period character.

4. Try to be wary of line lengths

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

