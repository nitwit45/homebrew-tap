cask "jetsam" do
  version "0.1.1"
  sha256 "ec6c9b97ae080cc5ea8eabdd0e4953a567f8e8a6fffab1c24b9e302b10eedca1"

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
