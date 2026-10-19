cask "gridcraft" do
  version "0.8.0"
  sha256 "260622fc0e0b18cc88162f0c2294759b58f8a32efa43ca6bf569e8b48aee2a23"

  url "https://github.com/storytold/gridcraft/releases/download/v#{version}/gridcraft-#{version}-macos-universal.dmg"
  name "GridCraft"
  desc "Spreadsheet and data tool"
  homepage "https://getartcraft.com/apps/gridcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "GridCraft.app"

  uninstall quit: "ai.storyteller.gridcraft"

  zap trash: [
    "~/Library/Application Support/GridCraft",
    "~/Library/Caches/ai.storyteller.gridcraft",
    "~/Library/Preferences/ai.storyteller.gridcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.gridcraft.savedState",
  ]
end
