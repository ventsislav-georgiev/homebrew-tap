# homebrew-tap

Homebrew tap for my own tools.

```sh
brew install --cask ventsislav-georgiev/tap/prosper
brew install ventsislav-georgiev/tap/dch      # or dch-lite
brew install ventsislav-georgiev/tap/ccpool
brew install ventsislav-georgiev/tap/k9s
```

| Formula | What |
| --- | --- |
| [prosper](https://github.com/ventsislav-georgiev/prosper) (cask) | macOS menu bar launcher |
| [dch](https://github.com/ventsislav-georgiev/dch) | Detachable terminal sessions with a headless agent API |
| [ccpool](https://github.com/ventsislav-georgiev/ccpool) | Run Claude Code across a pool of accounts, rotating on rate limits |
| [k9s](https://github.com/ventsislav-georgiev/k9s) | k9s with custom patches |

The Prosper cask and the dch formulae are auto-published by their release
workflows on every `v*` tag; Prosper also updates itself in-app via Sparkle,
and `auto_updates true` keeps the two from conflicting.
