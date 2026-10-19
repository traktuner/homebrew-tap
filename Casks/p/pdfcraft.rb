cask "pdfcraft" do
  version "0.9.0"
  sha256 "116738045a68463eb1a465e6eaef2266902aac69aa1a15e4a1c1472c31d8abe9"

  url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/pdfcraft-#{version}-macos-universal.dmg"
  name "PdfCraft"
  name "PrintCraft"
  desc "PDF editor and document manager"
  homepage "https://getartcraft.com/apps/pdfcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  auto_updates true
  depends_on :macos

  app "PdfCraft.app"

  uninstall quit: "ai.storyteller.pdfcraft"

  zap trash: [
    "~/Library/Application Support/PdfCraft",
    "~/Library/Caches/ai.storyteller.pdfcraft",
    "~/Library/Preferences/ai.storyteller.pdfcraft.plist",
    "~/Library/Saved Application State/ai.storyteller.pdfcraft.savedState",
  ]
end
