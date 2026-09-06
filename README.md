# havurgiray/homebrew-tap

Homebrew casks for [agent-history-tether (aht)](https://github.com/havurgiray/agent-history-tether).

```sh
brew install --cask havurgiray/tap/aht
aht install          # background watcher + Claude Code hook + aht command
aht adopt --apply    # tether this Mac's existing projects
```

The app is ad-hoc signed (no Apple Developer ID yet), so macOS blocks its
first launch: allow it once under System Settings > Privacy & Security >
Open Anyway, or clear the quarantine flag with
`xattr -dr com.apple.quarantine /Applications/aht.app`.

Upgrade with `brew upgrade --cask aht`; the app then offers to update the
installed core on its next launch (or run `aht install` again).
Remove with `brew uninstall --cask aht` (runs `aht uninstall` first; no
agent's history is ever touched) and `brew uninstall --zap --cask aht` to
also delete `~/.aht`.
