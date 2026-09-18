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

Upgrade with `brew upgrade --cask aht`, then run `aht install` again (or
accept the app's Update prompt) so the background watcher and the hook use
the new core.  To remove aht, run `aht uninstall` first (no agent's history
is ever touched), then `brew uninstall --cask aht`; add `--zap` to also
delete `~/.aht`.
