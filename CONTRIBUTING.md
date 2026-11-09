# Contributing

> Does this tap accept contributions, and how do its own changes land?

This repository is published for reading and use. It does not accept
issues, pull requests or feature requests. Report security problems
privately as described in [SECURITY.md](SECURITY.md).

## For maintainers

Each chargectl release opens a pull request here that writes
`Casks/chargectl.rb` and merges it once CI passes. To change the cask
itself, edit `scripts/cask.sh` in
[tyldra-org/chargectl](https://github.com/tyldra-org/chargectl); the next
release brings the change here. Never edit the URL or SHA-256 by hand.

Check a change locally before opening its pull request:

```sh
brew tap tyldra-org/tools "$PWD"
brew style tyldra-org/tools
brew audit --strict --online --tap tyldra-org/tools
brew install --cask tyldra-org/tools/chargectl
brew untap tyldra-org/tools
```

CI has three jobs: `formulas` runs `brew test-bot` (style and audit on
every cask and formula, and an install and test of each formula a pull
request changes), `workflows` runs actionlint and zizmor when `.github`
changes, and `check` passes only when both did. The `main` ruleset requires `check`.
When a `ci` run fails, `ci-retry` waits five minutes and re-runs its failed
jobs once, so a download that times out does not block a release. A second
failure stays red.

Every change lands by pull request, squash-merged with the pull request
title as the commit subject. Dependabot's weekly pull request for the
workflow actions merges by itself once `check` passes. Subjects use
`type(scope): summary`, such as `feat(chargectl): update to 0.2.0`: lowercase,
imperative, no trailing period, the scope being the cask's or formula's
name, left out for changes to the tap itself.
