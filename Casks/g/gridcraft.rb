cask "gridcraft" do
  version "0.19.1"
  sha256 "d50165e78b8e35abbe68aa7c6f36c290023dec650d8aa797ac2347a930f6c197"

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
