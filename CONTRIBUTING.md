# Contributing

> How do I change a formula or this tap, and how does it land?

## Update a formula

Each chargectl release attaches a filled-in `chargectl.rb`. Copy it to
`Formula/chargectl.rb` unchanged, on a branch, and open a pull request.
The release workflow wrote the URL and SHA-256, so do not edit them by hand.

## Check it locally

CI runs these on every pull request. To run them yourself, tap your clone
and check the formula from there:

```sh
brew tap tyldra-org/tools "$PWD"
brew style tyldra-org/tools
brew audit --strict --online --tap tyldra-org/tools
brew install tyldra-org/tools/chargectl
brew test tyldra-org/tools/chargectl
brew untap tyldra-org/tools
```

## What CI runs

Three jobs. `formulas` runs `brew test-bot`: style and audit on every
formula, and on a pull request an install, test and audit of each formula
it changes. `workflows` runs actionlint. `check` passes only when both did,
and the `main` ruleset in GitHub's settings requires it before a pull
request merges. CodeQL scans the workflows alongside.

## Commits and pull requests

- Subjects use `type(scope): summary`, such as
  `feat(chargectl): update to 0.2.0`. Lowercase, imperative, no trailing
  period, at most 80 characters. The scope is the formula's name; leave it
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
