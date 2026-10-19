cask "deckcraft" do
  version "0.8.0"
  sha256 "81ee3158cbb550951faf89888bf7f0ea296fc233593aecfc3f41c7d9dce88542"

  url "https://github.com/storytold/deckcraft/releases/download/v#{version}/deckcraft-#{version}-macos-universal.dmg"
  name "DeckCraft"
  desc "Presentation and slide show editor"
  homepage "https://getartcraft.com/apps/deckcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "DeckCraft.app"

  uninstall quit: "ai.storyteller.deckcraft"

  zap trash: [
    "~/Library/Application Support/DeckCraft",
    "~/Library/Caches/ai.storyteller.deckcraft",
    "~/Library/Preferences/ai.storyteller.deckcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.deckcraft.savedState",
  ]
end
