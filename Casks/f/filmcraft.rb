cask "filmcraft" do
  version "0.9.0"
  sha256 "d654a23bbd039561a69bc5530203769040ca4961e228245abb843752526d2124"

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
