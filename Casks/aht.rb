cask "aht" do
  version "0.9.0"
  sha256 "f8ac9217fa0872db6dac0197fd8580630162e5ecd3b93f353b8c0c0130e7543d"

  url "https://github.com/havurgiray/agent-history-tether/releases/download/v#{version}/aht-#{version}-macos-universal.zip"
  name "agent-history-tether"
  desc "Keeps AI coding agents' per-project histories tethered to their folders"
  homepage "https://github.com/havurgiray/agent-history-tether"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "aht.app"
  binary "#{appdir}/aht.app/Contents/Resources/bin/aht"

  uninstall quit:   "com.aht.app",
            script: {
              executable: "#{appdir}/aht.app/Contents/Resources/bin/aht",
              args:       ["uninstall"],
              must_succeed: false,
            }

  zap trash: [
    "~/.aht",
    "~/Library/LaunchAgents/com.aht.watcher.plist",
    "~/Library/LaunchAgents/com.aht.tray.plist",
  ]

  caveats <<~EOS
    Finish the setup (background watcher, Claude Code hook, `aht` command):
      aht install
    or open aht.app and accept "Set Up aht on This Mac".
    Then tether this Mac's existing projects:
      aht adopt --apply
    Installed with --no-quarantine? Then the app opens without a Gatekeeper
    prompt; otherwise allow it once under System Settings > Privacy & Security.
  EOS
end
