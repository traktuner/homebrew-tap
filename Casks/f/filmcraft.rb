cask "filmcraft" do
  version "0.2.1"
  sha256 "4deff5924e8e4040e60c73db2e668812a5967c973790be7565f8e8d9c69344fd"

  url "https://github.com/storytold/filmcraft/releases/download/v#{version}/filmcraft-#{version}-macos-universal.dmg"
  name "FilmCraft"
  desc "Video editor"
  homepage "https://getartcraft.com/apps/filmcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "FilmCraft.app"

  uninstall quit: "ai.storyteller.filmcraft"
end
