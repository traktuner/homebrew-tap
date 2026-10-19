cask "effectcraft" do
  version "0.11.1"
  sha256 "73471a98b510596bcca96c6c055665b36ebcf619d3937c3e246d5249ad046cf4"

  url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-#{version}-macos-universal.dmg"
  name "EffectCraft"
  desc "Motion graphics and visual effects editor"
  homepage "https://getartcraft.com/apps/effectcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "EffectCraft.app"

  uninstall quit: "ai.storyteller.effectcraft"

  zap trash: [
    "~/Library/Application Support/EffectCraft",
    "~/Library/Caches/ai.storyteller.effectcraft",
    "~/Library/Preferences/ai.storyteller.effectcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.effectcraft.savedState",
  ]
end
