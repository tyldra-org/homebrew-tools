# Contributing

> How do I change a cask, a formula or this tap, and how does it land?

## Update a cask

Each chargectl release opens a pull request here that writes
`Casks/chargectl.rb`, and merges it once CI passes. The same file is
attached to the release. To change the cask itself, edit `scripts/cask.sh`
in [tyldra-org/chargectl](https://github.com/tyldra-org/chargectl); the
next release brings the change here. Never edit the URL or SHA-256 by hand.

## Check it locally

CI runs these on every pull request. To run them yourself, tap your clone
and check the cask from there:

```sh
brew tap tyldra-org/tools "$PWD"
brew style tyldra-org/tools
brew audit --strict --online --tap tyldra-org/tools
brew install --cask tyldra-org/tools/chargectl
brew untap tyldra-org/tools
```

## What CI runs

Three jobs. `formulas` runs `brew test-bot`: style and audit on every
cask and formula, and on a pull request an install, test and audit of
each formula it changes. `workflows` runs actionlint. `check` passes only when both did,
and the `main` ruleset in GitHub's settings requires it before a pull
request merges. CodeQL scans the workflows alongside.

Dependabot's weekly pull request for the workflow actions merges by
itself: the `dependabot` workflow turns on auto-merge, and GitHub rebases
it onto `main` once `check` passes.

## Commits and pull requests

- Subjects use `type(scope): summary`, such as
  `feat(chargectl): update to 0.2.0`. Lowercase, imperative, no trailing
  period, at most 80 characters. The scope is the cask's or formula's name; leave it
  out for changes to the tap itself.
- Types: build, chore, ci, docs, feat, fix, refactor, revert, style, test.
- One reason to change per commit.
- The template asks what changed, why, the evidence and what's left. Grade
  each piece of evidence `verified`, `tested` or `untested`.
- `main` takes pull requests by rebase, so each commit lands as you wrote
  it. CI must pass, and every review thread must be resolved.

## Conduct and security

Follow the [code of conduct](CODE_OF_CONDUCT.md). Report vulnerabilities
privately, as [SECURITY.md](SECURITY.md) describes, never in a public issue.
