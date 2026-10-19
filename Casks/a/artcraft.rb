cask "artcraft" do
  version "0.5.1"
  sha256 "84f7b95acc229d9a997f91c3d110cd36131edde21f47f4a21c0f17d2ad3ca436"

  url "https://github.com/storytold/craft-launcher/releases/download/v#{version}/artcraft-launcher-#{version}-macos-universal.dmg"
  name "ArtCraft Launcher"
  desc "Installer and updater for the ArtCraft apps"
  homepage "https://getartcraft.com/apps"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "ArtCraft Launcher.app"

  uninstall quit: "ai.storyteller.artcraft-launcher"

  zap trash: [
    "~/Library/Application Support/ArtCraft Launcher",
    "~/Library/Caches/ai.storyteller.artcraft-launcher",
    "~/Library/Preferences/ai.storyteller.artcraft-launcher.plist",
    "~/Library/Saved Application State/ai.storyteller.artcraft-launcher.savedState",
  ]
end
