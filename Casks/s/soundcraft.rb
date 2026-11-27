cask "soundcraft" do
  version "0.20.1"
  sha256 "eb1dd392d7c3867b569aa9e08c016427096800016ff33f8f4e0192e43d9e6c0b"

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
