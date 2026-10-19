cask "lightcraft" do
  version "0.9.1"
  sha256 "5e3fde7755d0fd0fa91114fc58ef51093a81b6177dcd9aece0142b4ec10e1c5a"

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
