# RoundRect Homebrew tap

The Mac apps of [RoundRect](https://roundrect.download), as Homebrew casks.

```sh
brew tap roundrect/tap
brew trust roundrect/tap     # Homebrew 7 loads nothing from a third-party tap until you trust it; once covers every app here
brew install --cask roundrect/tap/swurl
brew install --cask roundrect/tap/shorty
```

| Cask | App |
|---|---|
| `swurl` | [Swurl](https://roundrect.download/swurl): a link router. It becomes your default browser and opens every link you click in the browser and profile your rules choose. |
| `shorty` | [Shorty](https://roundrect.download/shorty): manages macOS menu keyboard shortcuts and app hotkeys from one file. |

Both require macOS 15 (Sequoia) or later; Swurl requires Apple silicon. Each cask installs the app and links its
command-line tool (`swurl`, `shorty`). Both apps update themselves (Sparkle), so `brew upgrade` leaves an updated copy
alone.

This tap replaces `roundrect/swurl` and `roundrect/shorty`. Those taps' `tap_migrations.json` move an existing install
here on the next `brew update`.

## Releasing a new version

In the app's repository: `NOTARY_PROFILE=<profile> make release`, attach the DMG and `dist/appcast.xml` to the GitHub
release `vX.Y.Z` on the app's public repo (`roundrect/swurl`, `roundrect/shorty`), then update `version` and `sha256`
in `Casks/<app>.rb` here.
