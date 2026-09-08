cask "jdownloader2-safari" do
  version "1.1.0"
  sha256 "ea46e3aad98e86ec583e9f41a4783da9f8ca2f38dcc0ee4fb8bd6e8a7c536379"

  url "https://github.com/traktuner/jdownloader2-safari-extension/releases/download/v#{version}/MyJDownloader.zip"
  name "MyJDownloader Safari Extension"
  desc "Personal Safari port of the MyJDownloader browser extension"
  homepage "https://github.com/traktuner/jdownloader2-safari-extension"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MyJDownloader.app"

  # Personal-use installation must also work on a fresh Mac with no Apple
  # account or signing certificate. Never auto-select a development identity:
  # a revoked certificate can turn this app into a macOS malware-block alert.
  postflight_steps do
    # Check the checksum-pinned bundle before changing its signature.
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/MyJDownloader.app"]
    run "/usr/bin/codesign",
        args: ["--force", "--preserve-metadata=identifier,entitlements,flags,runtime", "--sign", "-",
               "{{appdir}}/MyJDownloader.app/Contents/PlugIns/MyJDownloader Extension.appex"]
    run "/usr/bin/codesign",
        args: ["--force", "--preserve-metadata=identifier,entitlements,flags,runtime", "--sign", "-",
               "{{appdir}}/MyJDownloader.app"]
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/MyJDownloader.app"]
    # Personal-use exception for this one locally signed app. Global
    # Gatekeeper and Safari policy remain under the user's control.
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/MyJDownloader.app"]
  end

  uninstall quit: "org.myjdownloader.MyJDownloader"

  zap trash: [
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader",
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader.Extension",
    "~/Library/Containers/org.myjdownloader.MyJDownloader",
    "~/Library/Containers/org.myjdownloader.MyJDownloader.Extension",
  ]

  caveats <<~EOS
    This personal build needs no Apple account or developer subscription.
    Open MyJDownloader once. In Safari Settings > Advanced, enable features
    for web developers, then in Developer enable Allow unsigned extensions.
    Enable MyJDownloader in Safari Settings > Extensions and allow the sites
    where you use it. Safari may require unsigned extensions to be allowed
    again after quitting. The app and extension have separate MyJD logins.
  EOS
end
