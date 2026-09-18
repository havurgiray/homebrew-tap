cask "aht" do
  version "0.9.1"
  sha256 "597f8ac00cc809c8fa9faa84f3d9e8996e8e14ed33e609de59beb30a72afb415"

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

  uninstall quit:   "com.aht.app",
            script: {
              executable:   "#{appdir}/aht.app/Contents/Resources/bin/aht",
              args:         ["uninstall"],
              must_succeed: false,
            }

  zap trash: [
    "~/.aht",
    "~/Library/LaunchAgents/com.aht.tray.plist",
    "~/Library/LaunchAgents/com.aht.watcher.plist",
  ]

  caveats <<~EOS
    Finish the setup (background watcher, Claude Code hook, `aht` command):
      aht install
    or open aht.app and accept "Set Up aht on This Mac".
    Then tether this Mac's existing projects:
      aht adopt --apply
    The app is ad-hoc signed, so macOS blocks its first launch: allow it once
    under System Settings > Privacy & Security > Open Anyway, or run
      xattr -dr com.apple.quarantine "#{appdir}/aht.app"
  EOS
end
