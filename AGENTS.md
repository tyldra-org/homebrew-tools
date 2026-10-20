# Agent guidance

> How should an agent work in this repository?

## What this is

The Homebrew tap for tyldra-org's tools: `brew install
tyldra-org/tools/<name>`. It holds the `chargectl` cask, a menu bar app
for battery charge limits on Apple Silicon MacBooks, whose source lives in
`github.com/tyldra-org/chargectl`. Human contributors start at
`CONTRIBUTING.md`, which agents read too.

## Rules

- A cask's or formula's URL, version and SHA-256 come from the tool's
  release workflow, which opens the pull request that updates it and
  attaches the same file to the release. Never type or guess a checksum.
- Casks and formulas install prebuilt release archives and build no bottles.
- Keep each one to what Homebrew's audit accepts: `brew style` and
  `brew audit --strict --online` must pass.

## Where things live

| Question | Owner |
| --- | --- |
| How do people install from the tap? | `README.md` |
| How does a change land? | `CONTRIBUTING.md` |
| How are security problems reported? | `SECURITY.md` |
| What does CI check? | `.github/workflows/ci.yml` |
| What must pass before a pull request merges? | the `main` ruleset in GitHub settings: CI's `check` job |
| Which GitHub settings and rules apply? | GitHub, under Settings; the repository keeps no copy |

## Commits and writing

Subjects use `type(scope): summary` as `CONTRIBUTING.md` describes, with
no AI attribution. Pushing, rewriting history, deleting branches and
changing GitHub settings each need the user's request. Documents are plain
and specific: sentence-case headings, no em dashes, no badges or emoji, no
claims beyond what was verified. Grade claims `verified`, `tested` or
`untested`.
