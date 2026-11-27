cask "figcraft" do
  version "0.18.1"
  sha256 "de7bc22fb363c57a350927f5ca009bd444b19993bdeb2863b564e99f3fbae230"

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
