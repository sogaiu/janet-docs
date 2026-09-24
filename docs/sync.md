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

## Guidlines for Making Changes

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

