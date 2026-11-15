# homebrew-tap

Homebrew tap for [Jetsam](https://github.com/nitwit45/jetsam), a macOS disk and memory cleaner for developers.

```sh
brew install --cask nitwit45/tap/jetsam
```

Jetsam is not notarized. The cask removes the quarantine attribute after it installs, so macOS does not block the first launch. If you would rather clear that yourself, install from the DMG on the [release page](https://github.com/nitwit45/jetsam/releases/latest).

`brew uninstall --cask jetsam` leaves a weekly clean you switched on in place. Turn it off under Settings first, or run `brew uninstall --zap --cask jetsam`, which also removes Jetsam's settings and logs.
