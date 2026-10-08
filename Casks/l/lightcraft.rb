cask "lightcraft" do
  version "0.4.0"
  sha256 "c74e45230a54bce09bf86cecee7e22f3374ee46f8ba779ddda3f4ee7910d3f5c"

  url "https://github.com/storytold/lightcraft/releases/download/v#{version}/lightcraft-#{version}-macos-universal.dmg"
  name "LightCraft"
  desc "Photo library and raw image editor"
  homepage "https://getartcraft.com/apps/lightcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "LightCraft.app"

  uninstall quit: "ai.storyteller.lightcraft"
end
