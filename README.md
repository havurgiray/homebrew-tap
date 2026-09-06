# havurgiray/homebrew-tap

Homebrew casks for [agent-history-tether (aht)](https://github.com/havurgiray/agent-history-tether).

```sh
brew install --cask --no-quarantine havurgiray/tap/aht
aht install          # background watcher + Claude Code hook + aht command
aht adopt --apply    # tether this Mac's existing projects
```

`--no-quarantine` matters: the app is ad-hoc signed (no Apple Developer ID
yet), so a quarantined copy would be blocked by Gatekeeper until allowed
under System Settings > Privacy & Security.

Upgrade with `brew upgrade --cask aht`; the app then offers to update the
installed core on its next launch (or run `aht install` again).
Remove with `brew uninstall --cask aht` (runs `aht uninstall` first; no
agent's history is ever touched) and `brew uninstall --zap --cask aht` to
also delete `~/.aht`.
