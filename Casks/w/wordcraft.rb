cask "wordcraft" do
  version "0.8.0"
  sha256 "9c7c058e4bc0ea3dd4e7f350e934b5e5ff5798723937f382c77478a6978f89e3"

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
