cask "designcraft" do
  version "0.2.1"
  sha256 "0fc01e43e20b963d0493b0978fedc0dc42084c00bd47b37e4b7b67e983789612"

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
