cask "photocraft" do
  version "0.10.0"
  sha256 "2f2e21a0119e8e63b2b2f93d238817b3727af88720ab9e2b6deb1458927a3b1f"

  url "https://github.com/storytold/photocraft/releases/download/v#{version}/photocraft-#{version}-macos-universal.dmg"
  name "PhotoCraft"
  desc "Image editor"
  homepage "https://getartcraft.com/apps/photocraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "PhotoCraft.app"

  uninstall quit: "ai.storyteller.photocraft"

  zap trash: [
    "~/Library/Application Support/Photocraft",
    "~/Library/Caches/ai.storyteller.photocraft",
    "~/Library/Preferences/ai.storyteller.photocraft.plist",
    "~/Library/Saved Application State/ai.storyteller.photocraft.savedState",
  ]
end
