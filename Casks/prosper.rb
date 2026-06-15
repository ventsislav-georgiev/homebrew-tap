cask "prosper" do
  version "2.87.0"
  sha256 "fbcab0e94eff657423fe6cd2799d4ef91fb83520243c3ee4f9e1363c940e5e93"

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
