# homebrew-traktuner
Homebrew tap for traktuner


## Craft apps

Install all seven Craft apps with one command:

```sh
brew install --cask traktuner/tap/craft-apps
```

The bundle installs PhotoCraft, VectorCraft, FilmCraft, LightCraft, PdfCraft, EffectCraft, and DesignCraft. PdfCraft's current release installs `PrintCraft.app`.

Homebrew installs missing apps through their individual Casks. It skips apps that are already installed. Each app retains its GitHub release download, livecheck, and `auto_updates` setting. The existing autobump workflow continues to update the component Casks.

The bundle stages a small archive of this tap as metadata. It has no shared application version. Updates to the individual apps follow their component Casks.

Remove the bundle with:

```sh
brew uninstall --cask traktuner/tap/craft-apps
```

The individual apps remain installed. Remove each app separately when required.

The reported FilmCraft DMG mount failure on macOS 27 remains unresolved. Bundle installation uses the same individual Casks and can fail at the same mount step.
