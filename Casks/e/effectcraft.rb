cask "effectcraft" do
  version "0.4.0"
  sha256 "276fa037741900809ad4c9ed82e70a02e810e4e92a5b20976fb2dac6d694e71a"

  url "https://github.com/storytold/effectcraft/releases/download/v#{version}/effectcraft-#{version}-macos-universal.dmg"
  name "EffectCraft"
  desc "Motion graphics and visual effects editor"
  homepage "https://getartcraft.com/apps/effectcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "EffectCraft.app"

  uninstall quit: "ai.storyteller.effectcraft"
end
