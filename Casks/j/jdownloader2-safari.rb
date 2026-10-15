cask "jdownloader2-safari" do
  version "1.2.4"
  sha256 "9542f5d5fbf13498ca740dc03d86b338287396ce23728cf7e47468b014cd4273"

  url "https://github.com/traktuner/jdownloader2-safari-extension/releases/download/v#{version}/MyJDownloader.zip"
  name "MyJDownloader Safari Extension"
  desc "Personal Safari port of the MyJDownloader browser extension"
  homepage "https://github.com/traktuner/jdownloader2-safari-extension"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  # Releases from v1.2.0 on are Developer ID signed and notarized by Apple.
  # Never re-sign the app here: that would replace the notarized signature and
  # Safari would hide the extension again after every quit.
  app "MyJDownloader.app"

  uninstall quit: "org.myjdownloader.MyJDownloader"

  zap trash: [
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader",
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader.Extension",
    "~/Library/Containers/org.myjdownloader.MyJDownloader",
    "~/Library/Containers/org.myjdownloader.MyJDownloader.Extension",
  ]

  caveats <<~EOS
    Open MyJDownloader once and log in. Enable "Start at login" there if you
    want native Click'n'Load on 127.0.0.1:9666.
    Then enable MyJDownloader in Safari Settings > Extensions and allow it on
    all websites. The app and the Safari extension have separate MyJD logins.
  EOS
end
