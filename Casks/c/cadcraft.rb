cask "cadcraft" do
  version "0.20.1"
  sha256 "c9ef1cf02234e6a5e854287a64fe314ad6d53227915c3c6664fa4161e2a1fe70"

  url "https://github.com/storytold/cadcraft/releases/download/v#{version}/cadcraft-#{version}-macos-universal.dmg"
  name "CADCraft"
  desc "Computer-aided design and drafting tool"
  homepage "https://getartcraft.com/apps/cadcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "CADCraft.app"

  uninstall quit: "ai.storyteller.cadcraft"

  zap trash: [
    "~/Library/Application Support/CADCraft",
    "~/Library/Caches/ai.storyteller.cadcraft",
    "~/Library/Preferences/ai.storyteller.cadcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.cadcraft.savedState",
  ]
end
