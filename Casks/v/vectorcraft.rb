cask "vectorcraft" do
  version "0.7.0"
  sha256 "c9976419f038c0ecec2da569a4afc1717c2ffdaf54c7ab40d26b0c7f066ffa9e"

  url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-#{version}-macos-universal.dmg"
  name "VectorCraft"
  desc "Vector graphics editor"
  homepage "https://getartcraft.com/apps/vectorcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "VectorCraft.app"

  uninstall quit: "ai.storyteller.vectorcraft"
end
