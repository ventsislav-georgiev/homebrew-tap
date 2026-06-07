cask "prosper" do
  version "2.1.0"
  sha256 "b86b022800c2060889385d139c056028a81b9ede1dc39c229d37babbba72d501"

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
