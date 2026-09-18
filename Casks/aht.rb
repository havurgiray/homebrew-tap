cask "aht" do
  version "0.9.2"
  sha256 "234fc55f4c03afe3d6386a5fc2ee6831a4736ae7cebb7aaf4274b7c81b96515d"

  url "https://github.com/havurgiray/agent-history-tether/releases/download/v#{version}/aht-#{version}-macos-universal.zip"
  name "agent-history-tether"
  desc "Keeps AI coding agents' per-project histories tethered to their folders"
  homepage "https://github.com/havurgiray/agent-history-tether"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "aht.app"
  binary "#{appdir}/aht.app/Contents/Resources/bin/aht"

  # The app is all Homebrew manages.  The watcher, the Claude Code hook and
  # the core live under ~/.aht and are set up and removed by `aht install` /
  # `aht uninstall`, so an upgrade never takes them down.
  uninstall quit: "com.aht.app"

  zap trash: [
    "~/.aht",
    "~/Library/LaunchAgents/com.aht.tray.plist",
    "~/Library/LaunchAgents/com.aht.watcher.plist",
  ]

  caveats <<~EOS
    Finish the setup (background watcher, Claude Code hook, `aht` command):
      aht install
    or open aht.app and accept "Set Up aht on This Mac".  After an upgrade,
    run `aht install` again (or accept the app's Update prompt) so the
    watcher and the hook use the new core.  Then tether existing projects:
      aht adopt --apply
    To remove aht, run `aht uninstall` BEFORE `brew uninstall --cask aht`.
    The app is ad-hoc signed, so macOS blocks its first launch: allow it once
    under System Settings > Privacy & Security > Open Anyway, or run
      xattr -dr com.apple.quarantine "#{appdir}/aht.app"
  EOS
end
