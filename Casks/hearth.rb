cask "hearth" do
  version "0.1.3"
  sha256 "5a240592c25ca3f8796335d5156d48ebcb0277847744db67c79f57c3b2ddd8d0"

  url "https://github.com/warrenseine/hearth/releases/download/v#{version}/Hearth-#{version}.zip"
  name "Hearth"
  desc "Menu bar app and GUI for process-compose"
  homepage "https://github.com/warrenseine/hearth"

  depends_on formula: "f1bonacc1/tap/process-compose"
  depends_on macos: :tahoe

  app "Hearth.app"

  # Unsigned app: each release is a new ad-hoc build, so a Gatekeeper "Open Anyway" approval
  # doesn't survive an upgrade. Strip the quarantine flag so install and upgrade both just work.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Hearth.app"]
  end

  zap trash: [
    "~/Library/Application Support/Hearth",
    "~/Library/Logs/Hearth",
    "~/Library/Preferences/ai.hearth.app.plist",
    "~/Library/Saved Application State/ai.hearth.app.savedState",
  ]

  caveats <<~EOS
    Hearth is unsigned (no Apple Developer ID yet). This cask removes the quarantine
    flag on install and upgrade, so Gatekeeper doesn't block it. If macOS still refuses
    to open it, run:
      xattr -dr com.apple.quarantine /Applications/Hearth.app
  EOS
end
