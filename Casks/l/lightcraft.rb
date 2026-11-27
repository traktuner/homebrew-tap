cask "lightcraft" do
  version "0.21.1"
  sha256 "b70f46cac01390154c9adfa06822e6691b95fc270c507b0ed220a00dc588bb1e"

  url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-#{version}-macos-universal.dmg"
  name "LightCraft"
  desc "Photo library and raw image editor"
  homepage "https://getartcraft.com/apps/lightcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "LightCraft.app"

  uninstall quit: "ai.storyteller.lightcraft"

  zap trash: [
    "~/Library/Application Support/LightCraft",
    "~/Library/Caches/ai.storyteller.lightcraft",
    "~/Library/Preferences/ai.storyteller.lightcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.lightcraft.savedState",
  ]
end
