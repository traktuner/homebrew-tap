cask "figcraft" do
  version "0.7.0"
  sha256 "161283ed574f078ee2a2249c3d07e059bc88e4881c2e08217b57df1eed60225d"

  url "https://github.com/storytold/figcraft/releases/download/v#{version}/figcraft-#{version}-macos-universal.dmg"
  name "FigCraft"
  desc "Interface design and prototyping tool"
  homepage "https://getartcraft.com/apps/figcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "FigCraft.app"

  uninstall quit: "ai.storyteller.figcraft"

  zap trash: [
    "~/Library/Application Support/FigCraft",
    "~/Library/Caches/ai.storyteller.figcraft",
    "~/Library/Preferences/ai.storyteller.figcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.figcraft.savedState",
  ]
end
