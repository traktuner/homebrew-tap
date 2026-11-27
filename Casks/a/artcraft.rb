cask "artcraft" do
  version "0.20.3"
  sha256 "eaf4f1eb46d2a2c6c9218e46d3ea2f9e940bc8409d36a492e5049430acfde3ae"

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
