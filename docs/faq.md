# Unofficial FAQ List

The following is a list of questions and answers (or links to answers)
that seemed worth collecting in one place.  It's a different sort of
list than the [one in the repository
README](https://github.com/janet-lang/janet/blob/4370ae8acc5f1141a241becb8b2a2badc75ac8fe/README.md#faq).

1. How can I learn more about the background and goals of the project?

   * [Interview with
     bakpakin](https://alexalejandre.com/interviews/interview-with-bakpakin/) -
     relatively recent information courtesy of Alex Alejandre

   * [What are the goals of the Janet
     project?](https://github.com/janet-lang/janet/discussions/554) -
     older GitHub discussion started by Mike Beller

2. Does Janet have contribution policies?

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

3. Is there a recommended way to install janet and related bits without
   `sudo` (aka per-user / local install)?

   See the [Non-root install (macOS and
   Unix-like)](https://janet-lang.org/docs/index.html#Non-root-install-(macOS-and-Unix-like))
   instructions for compiling from source.

4. Are there any gotchas when using the binaries from GitHub releases
   for *nix systems?

   *nix prebuilt binaries from gh are ok for light testing but due to
   having `/usr/local/lib/janet` hard-wired in, ignore `PREFIX` and
   thus may require work to get working with certain setups.  See [this
   issue](https://github.com/janet-lang/jpm/issues/96) for some details
   and pointers.

   Since for *nix, it's pretty easy to build janet from source, if that
   works for your situation, it may be a simpler path.

5. What are some resources for learning to use Janet?

   * [Janet website](https://janet-lang.org/docs/index.html) - official website

   * [Janet for Mortals](https://janet.guide) - @ianthehenry's book

6. Should I use jpm, janet-pm, or something else?

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
     evolved as `janet-pm`.

7. What sort of editor support is there?

   In alphabetical order, some options are:

   * Emacs
   * Helix
   * Vim / Neovim
   * VSCode / VSCodium - vscode-janet-plus-plus
   * ...

   See [here](https://janet-lang.org/#Editor-Support) for some links.

8. Where can I find codebases that use Janet?

   [Here](https://github.com/sogaiu/janet-examples) is a collection of
   relevant links.

9. Where do Janeteers hang out?

   ATM, the most active may be the [Zulip
   instance](https://janet.zulipchat.com).
