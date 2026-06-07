cask "prosper" do
  version "2.2.0"
  sha256 "4bdf9b6fca0957df604dbf719e43e00acea7b0e40608131016ec34ee71b96a65"

  url "https://github.com/ventsislav-georgiev/prosper/releases/download/v#{version}/Prosper-#{version}.zip"
  name "Prosper"
  desc "Local-LLM inline autocomplete, command palette, and clipboard history"
  homepage "https://github.com/ventsislav-georgiev/prosper"

  # Prosper updates itself in-app via Sparkle. auto_updates true tells Homebrew
  # the app self-updates, so `brew upgrade` won't fight Sparkle (Ghostty pattern).
  auto_updates true
  depends_on macos: ">= :sonoma"

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
