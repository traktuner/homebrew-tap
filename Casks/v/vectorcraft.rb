cask "vectorcraft" do
  version "0.24.1"
  sha256 "8dee5996b0d95fc0a8bc8b9d95cac24834a623cb08036a0cea8bb6c0e974caad"

  url "https://github.com/storytold/vectorcraft/releases/download/v#{version}/vectorcraft-#{version}-macos-universal.dmg"
  name "VectorCraft"
  desc "Vector graphics editor"
  homepage "https://getartcraft.com/apps/vectorcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "VectorCraft.app"

  uninstall quit: "ai.storyteller.vectorcraft"

  zap trash: [
    "~/Library/Application Support/VectorCraft",
    "~/Library/Caches/ai.storyteller.vectorcraft",
    "~/Library/Preferences/ai.storyteller.vectorcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.vectorcraft.savedState",
  ]
end
