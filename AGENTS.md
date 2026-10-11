# Agent guidance

> How should an agent work in this repository?

## What this is

The Homebrew tap for tyldra-org's tools: `brew install
tyldra-org/tools/<formula>`. Today it holds `chargectl`, battery charge
control for Apple Silicon MacBooks, whose source lives in
`github.com/tyldra-org/chargectl`. Human contributors start at
`CONTRIBUTING.md`, which agents read too.

## Rules

- A formula's URL, version and SHA-256 come from the tool's release
  workflow, which attaches a filled-in formula to each release. Copy that
  file; never type or guess a checksum.
- Formulas install prebuilt release binaries and build no bottles.
- Keep each formula to what Homebrew's audit accepts: `brew style` and
  `brew audit --strict --online` must pass.

## Never run

- anything with `sudo`, including `sudo chargectl install`
- `brew install` against the user's real Homebrew without asking; CI
  installs on its own runner

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
