cask "designcraft" do
  version "0.21.1"
  sha256 "9964d13556c7e0f03abf6f4ab20bde8a9d6c9db744d4d3cc6c67753862064f00"

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
