cask "filmcraft" do
  version "0.20.1"
  sha256 "5722f0f21ca96583ee27dfd88bae23e0a4a6ab87862a6c00082c88c5c759e75e"

  url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-#{version}-macos-universal.dmg"
  name "FilmCraft"
  desc "Video editor"
  homepage "https://getartcraft.com/apps/filmcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "FilmCraft.app"

  uninstall quit: "ai.storyteller.filmcraft"

  zap trash: [
    "~/Library/Application Support/FilmCraft",
    "~/Library/Caches/ai.storyteller.filmcraft",
    "~/Library/Preferences/ai.storyteller.filmcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.filmcraft.savedState",
  ]
end
