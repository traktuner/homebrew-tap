cask "effectcraft" do
  version "0.6.0"
  sha256 "2b8e99b7f1e497ed0f7273cf21084d23858500734e9fb755e869a5b0854975ca"

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
