cask "jetsam" do
  version "0.1.0"
  sha256 "ea0c254a3b4abe46d00fd9ccb1ac1bd278dc77fcb7ae51c75e8aed23716c661e"

  url "https://github.com/nitwit45/jetsam/releases/download/v#{version}/Jetsam.dmg"
  name "Jetsam"
  desc "Disk and memory cleaner for developers"
  homepage "https://github.com/nitwit45/jetsam"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Jetsam.app"

  # Jetsam is not notarized, so macOS would block the first launch of a quarantined copy.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Jetsam.app"], must_succeed: false
  end

  uninstall quit: "dev.nith.jetsam"

  zap launchctl: "com.nith.jetsam.weekly",
      trash:     [
        "~/Library/Application Support/Jetsam",
        "~/Library/Caches/dev.nith.jetsam",
        "~/Library/LaunchAgents/com.nith.jetsam.weekly.plist",
        "~/Library/Logs/Jetsam",
        "~/Library/WebKit/dev.nith.jetsam",
      ]
end
