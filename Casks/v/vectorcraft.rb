cask "vectorcraft" do
  version "0.4.0"
  sha256 "3aeba910c24934f31c6e1b408916e83c38956f201a4138c013d63dd9d6c54233"

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
