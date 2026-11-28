# tyldra Homebrew tools

> How do I install tyldra's tools with Homebrew?

```sh
brew install tyldra/tools/keynook
brew install --cask tyldra/tools/chargectl
```

Either command adds this tap the first time. After that, `brew upgrade` keeps
them up to date like anything else from Homebrew.

## What's here

| Name | Kind | What it is |
| --- | --- | --- |
| `keynook` | Formula | API key manager for the Mac terminal, backed by the login Keychain. [tyldra/keynook](https://github.com/tyldra/keynook) |
| `chargectl` | Cask | Battery charge limits for Apple Silicon MacBooks, from the menu bar. [tyldra/chargectl](https://github.com/tyldra/chargectl) |

Command-line tools are formulas and apps are casks, so `keynook` installs
without `--cask` and `chargectl` with it.

This repository does not accept issues or pull requests; see
[CONTRIBUTING.md](CONTRIBUTING.md). Report security problems privately as
[SECURITY.md](SECURITY.md) describes.

## License

Apache-2.0, as [LICENSE](LICENSE) states.
