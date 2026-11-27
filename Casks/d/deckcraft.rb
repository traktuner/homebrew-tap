cask "deckcraft" do
  version "0.19.1"
  sha256 "a5233f28b031b74edc4a07df2a0068d43b82ccadfdac865f145765d28b2ce746"

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
