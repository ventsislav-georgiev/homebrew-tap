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

  zap trash: [
    "~/Library/Preferences/com.prosper.app.plist",
    "~/Library/Application Support/Prosper",
  ]
end
