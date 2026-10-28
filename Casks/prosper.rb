cask "prosper" do
  version "2.160.0"
  sha256 "e8ba8c7fb8e525ebd6fc20ece2f62a5e40a2e49bee4c136afe06fec7fe5a1624"

  url "https://github.com/ventsislav-georgiev/prosper/releases/download/v#{version}/Prosper-#{version}.zip"
  name "Prosper"
  desc "Local-LLM inline autocomplete, command palette, and clipboard history"
  homepage "https://github.com/ventsislav-georgiev/prosper"

  # No auto_updates: let `brew upgrade` manage Prosper like any other cask
  # (auto_updates true made Homebrew skip it unless --greedy / named explicitly).
  # Sparkle still serves in-app updates for users who installed outside Homebrew.
  depends_on macos: :sonoma

  app "Prosper.app"

  # Prosper is ad-hoc signed (free distribution, not Apple-notarized), so the
  # first launch would otherwise hit the Gatekeeper "unidentified developer"
  # dialog. Strip the quarantine flag on install so `brew install` is
  # prompt-free. (The app also self-strips on first launch via QuarantineStripper.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Prosper.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.prosper.app.plist",
    "~/Library/Application Support/Prosper",
  ]
end
