# Security policy

> How do I report a security problem, and what can this tap reach?

## Report a problem privately

Use GitHub's private reporting:
<https://github.com/tyldra-org/homebrew-tools/security/advisories/new>.
If that page is unavailable, email yogeshprasad098@gmail.com instead. Do
not open a public issue. A problem in chargectl itself belongs in
[chargectl's security policy](https://github.com/tyldra-org/chargectl/security/policy).

Only the latest `main` is supported. The project has one maintainer;
response time depends on their availability.

## What the tap can reach

A formula tells Homebrew what to download and where to put it. Homebrew
installs without administrator rights, so a formula cannot change
anything outside Homebrew's own folders. A tool that needs more asks for
it separately, as its own README describes.

Each formula names a release archive by URL and SHA-256. Homebrew refuses a
download whose checksum differs, so a changed archive cannot install. The
checksum in the formula comes from the release workflow of the tool's own
repository, which also attests the archive: `gh attestation verify
<archive> --repo tyldra-org/chargectl` shows where it was built.

## Repository automation

CI runs with a read-only token and no secrets. Actions are pinned to full
commit SHAs, and Dependabot proposes updates weekly. CodeQL scans the
workflows on every pull request and weekly.

The repository's rules live in its GitHub settings. Contributors reach
`main` through pull requests that pass CI; admins may push directly, and CI
still runs on those pushes. Nobody may force-push or delete `main`. Secret
scanning runs with push protection. CI waits for a maintainer's approval on
every outside contributor's pull request.
