# tyldra-org Homebrew tools

> How do I install tyldra-org's tools with Homebrew?

```sh
brew install tyldra-org/tools/chargectl
```

That adds this tap and installs the formula. After the first time,
`brew install chargectl` and `brew upgrade` work like any other formula.

## Formulas

| Formula | What it is |
| --- | --- |
| `chargectl` | Battery charge control for Apple Silicon MacBooks, from the terminal. [tyldra-org/chargectl](https://github.com/tyldra-org/chargectl) |

chargectl's background service needs administrator rights, once, after
installing and after each upgrade:

```sh
sudo chargectl install
```

## Updating a formula

Each chargectl release attaches a filled-in `chargectl.rb`. Copy it to
`Formula/chargectl.rb` here, through a pull request. The formula downloads
the release archive and checks it against the SHA-256 in the file.

## License

Apache-2.0, as [LICENSE](LICENSE) states.
