cask "vectorcraft" do
  version "0.13.1"
  sha256 "b932c38927a007f30218c4ed404a5c48a3f41674d6e4c560a662c7ffdbdb706f"

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
