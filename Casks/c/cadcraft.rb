cask "cadcraft" do
  version "0.8.0"
  sha256 "518c8f38df85112ae37b62778d6b4b4d3e85dbf922cac5737d4765d508b77ee1"

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
