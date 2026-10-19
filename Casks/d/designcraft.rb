cask "designcraft" do
  version "0.9.0"
  sha256 "7fe7578040fb1b340b063d513b62cf7e53335274453327b287998221bb52768e"

  url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-#{version}-macos-universal.dmg"
  name "DesignCraft"
  desc "Page layout and publishing tool"
  homepage "https://getartcraft.com/apps/designcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "DesignCraft.app"

  uninstall quit: "ai.storyteller.designcraft"

  zap trash: [
    "~/Library/Application Support/DesignCraft",
    "~/Library/Caches/ai.storyteller.designcraft",
    "~/Library/Preferences/ai.storyteller.designcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.designcraft.savedState",
  ]
end
