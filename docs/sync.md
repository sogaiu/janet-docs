# Documentation Synchronization Issues

## Background

Currently the janet-lang.org website content is built based on content
that lives at a [corresponding
repository](https://github.com/janet-lang/janet-lang.org/).  It hosts
information about janet itself, but also `spork` and `jpm`.

Looking at [this repository
subdirectory](https://github.com/janet-lang/janet-lang.org/tree/master/content),
one can see a directory each for `jpm` and `spork` apart from most of
the source material for the rest of the site.

At the same time, the [`jpm`
repository](https://github.com/janet-lang/jpm) also has a [directory
that hosts its own documentation source
files](https://github.com/janet-lang/jpm/tree/master/content), and a
similar situation is the case for
[`spork`](https://github.com/janet-lang/spork) [1].

It looks like these documentation source trees are all independent,
i.e. janet-lang.org doesn't have content that is automatically /
programmatically updated based on changes to the spork or jpm
repositories.

Not being so aware of this situation, I think we'd been making changes
to documentation in separate locations without considering
synchronization / divergence issues.  A series of PRs have been merged
to eliminate the divergences, but may be it would be better if we came
up with a way to avoid this kind of thing happening again going
forward.

Please see [this Zulip
discussion](https://janet.zulipchat.com/#narrow/channel/399615-general/topic/syncing.20of.20docs.20among.20janet-lang.2Eorg.2C.20spork.2C.20and.20jpm.20repos/near/625624573)
for further details.

## Guidelines for Making Changes

Below is a draft set of guidelines concerning the making of changes:

1. For spork docs, the source of truth is the spork repository.  When
   there is a prose doc change merged there, someone should manually
   update the corresponding docs at the janet-lang.org repository in
   an appropriate fashion.

2. For jpm docs, because the prose only lives at janet-lang.org's
   repository, prose changes should be submitted there instead of the
   jpm respository.

3. Structural changes to jpm / spork docs would probably benefit from
   some kind of discussion.

## Longer-term Ideas

Below are some ideas about what might be done to avoid / reduce
manual synchronization.

1. Factor out content bits and apply different templates in both
   repositories to generate existing `.mdz` files.

   This approach might require changes to existing work-flows, e.g.
   `mdz build` and `mdz watch` might not be enough because an extra
   build step (to create the existing `.mdz` files from source files)
   might be needed.

2. Extract content from existing `.mdz` files (e.g. from the spork
   repository) and import and transform for use at the janet-lang.org
   repository.  Altering original source content to make it easier and
   more reliable to extract might be worth considering as well.
   
   There would probably need to be a step to bring in new / changed
   content (e.g. from the spork repository) from time to time as well.

3. Drop docs from spork and jpm repositories.  A downside is that
   finding a set of docs that allegedly is related to a particular
   version of spork / jpm is made more difficult.

4. Drop spork and jpm docs from janet-lang.org repositories.  Sync
   issues would be solved, but docs that were there before are gone
   unless some other measure is taken.

5. Keep files the same (except api/index.mdz and index.mdz?) and
   provide different implementations of macros and templates so that
   the effects differ for the two situations but the `.mdz` files are
   the same.  This might be seen as kind of a hack.

## Notes on Exactly How Things Differ

The basic structure of `spork` and `jpm` docs is that there is a
directory containing at least `index.mdz` and a subdirectory named
`api`.  For `spork`, the directory is named `doc` and for `jpm`, the
directory is named `content`.

Within the `janet-lang.org` repository, there is a `content` directory
inside which there are `jpm` and `spork` directories.  Both of these
directories contain `index.mdz` files as well as `api` directories.

In `jpm`'s case though, there are also some additional files that are
siblings of the `index.mdz` file and `api` directory.  These don't
exist in the `jpm` repository.

Below are some more details about differences.  Left refers to content
at `spork` or `jpm` repositories and right refers to `janet-lang.org`
content.

* Top-level `index.mdz` - only frontmatter differences

  * left - :author, :license, different :template
  
  * right - no :author, no :license, different :template, :order

* `api/*.mdz` (except index.mdz?) - initial code, frontmatter + macro
  call at end.  Content below expressed in terms of `spork`'s
  `argparse` for concreteness.

  * left

    * different :template "mdzdoc/main.html"
    * `@api-docs("../../spork" "argparse")` at end

  * right

    * initial code

        ```
        (import ../../gen-docs :as gen-docs)
        (import spork/argparse :export true)
        (setdyn :source-linker (partial gen-docs/github-source-linker "janet-lang/spork" gen-docs/spork-version))
        (setdyn :no-community-examples true)
        ```

    * different :template "docpage.html"
    * `@gen-docs/gen-prefix-current[argparse/]` at end

* `api/index.mdz` - initial code, frontmatter + macro call at end.
  Content below expressed in terms of `spork`.

  * left

    * different :template "mdzdoc/main.html"
    * `@api-docs[../../spork]` at end
    * body has

        ```
        @api-index[../../spork]

        ## Reference
        ```

  * right

    * initial code

        ```
        (import ../../gen-docs :as gen-docs)
        (import spork/argparse :export true)
        (setdyn :source-linker (partial gen-docs/github-source-linker "janet-lang/spork" gen-docs/spork-version))
        (setdyn :no-community-examples true)
        ```

    * different :template "docpage.html"
    * `@gen-docs/gen-prefix-current[]` at end

