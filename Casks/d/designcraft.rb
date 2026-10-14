cask "designcraft" do
  version "0.4.0"
  sha256 "6c46a54bf0b990fcfa81ea3849bad5b673a53ede06a9580cc3fc1cdfe82da5ae"

  url "https://github.com/storytold/designcraft/releases/download/v#{version}/designcraft-#{version}-macos-universal.dmg"
  name "DesignCraft"
  desc "Page layout and publishing tool"
  homepage "https://getartcraft.com/apps/designcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "DesignCraft.app"

  uninstall quit: "ai.storyteller.designcraft"
end
