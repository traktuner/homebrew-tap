cask "photocraft" do
  version "0.3.0"
  sha256 "c0b0223cddb18dd7f5607fb4d6cc6a925a62f5b5b47457997d61ad0f72aa5911"

  url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-#{version}-macos-universal.dmg"
  name "PhotoCraft"
  desc "Image editor"
  homepage "https://getartcraft.com/apps/photocraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "PhotoCraft.app"

  uninstall quit: "ai.storyteller.photocraft"
end
