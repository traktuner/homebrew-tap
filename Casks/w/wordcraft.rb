cask "wordcraft" do
  version "0.19.1"
  sha256 "df13cabf63bb2591045ebf6782c17440e7ecee9556550d6dd2affecd983825b2"

  url "https://github.com/storytold/wordcraft/releases/download/v#{version}/wordcraft-#{version}-macos-universal.dmg"
  name "WordCraft"
  desc "Writing and document design tool"
  homepage "https://getartcraft.com/apps/wordcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "WordCraft.app"

  uninstall quit: "ai.storyteller.wordcraft"

  zap trash: [
    "~/Library/Application Support/WordCraft",
    "~/Library/Caches/ai.storyteller.wordcraft",
    "~/Library/Preferences/ai.storyteller.wordcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.wordcraft.savedState",
  ]
end
