cask "soundcraft" do
  version "0.8.0"
  sha256 "4221c313d25abc1aaca51d1495a19735b5e3c240a6820c566779c6e0b4c35320"

  url "https://github.com/storytold/soundcraft/releases/download/v#{version}/soundcraft-#{version}-macos-universal.dmg"
  name "SoundCraft"
  desc "Audio recording, editing and mixing tool"
  homepage "https://getartcraft.com/apps/soundcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "SoundCraft.app"

  uninstall quit: "ai.storyteller.soundcraft"

  zap trash: [
    "~/Library/Application Support/SoundCraft",
    "~/Library/Caches/ai.storyteller.soundcraft",
    "~/Library/Preferences/ai.storyteller.soundcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.soundcraft.savedState",
  ]
end
