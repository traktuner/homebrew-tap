cask "pdfcraft" do
  version "0.22.0"
  sha256 "ad45ca52a793c7cda1bae1acb6757b5ee12f07bfaec22ce4344e5e5460340634"

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
