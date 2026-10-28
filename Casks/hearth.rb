cask "hearth" do
  version "0.1.2"
  sha256 "d11cee7edc12046d59003f1d5e7ed78e9811322fcf61c055c990307b39555835"

  url "https://github.com/warrenseine/hearth/releases/download/v#{version}/Hearth-#{version}.zip"
  name "Hearth"
  desc "Menu bar app and GUI for process-compose"
  homepage "https://github.com/warrenseine/hearth"

  depends_on formula: "f1bonacc1/tap/process-compose"
  depends_on macos: :tahoe

  app "Hearth.app"

  zap trash: [
    "~/Library/Application Support/Hearth",
    "~/Library/Logs/Hearth",
    "~/Library/Preferences/ai.hearth.app.plist",
    "~/Library/Saved Application State/ai.hearth.app.savedState",
  ]

  caveats <<~EOS
    Hearth is unsigned (no Apple Developer ID yet). On first launch, Gatekeeper will
    refuse to open it. Approve it once in System Settings > Privacy & Security >
    "Open Anyway", or run:
      xattr -dr com.apple.quarantine /Applications/Hearth.app
  EOS
end
