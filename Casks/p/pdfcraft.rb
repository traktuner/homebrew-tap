cask "pdfcraft" do
  version "0.2.1"
  sha256 "5b743dcdf1abbb12432b82f11dabc929bf8aa83866bfd3d110ca05428088dd10"

  url "https://github.com/storytold/pdfcraft/releases/download/v#{version}/printcraft-#{version}-macos-universal.dmg"
  name "PrintCraft"
  name "PdfCraft"
  desc "PDF editor and document manager"
  homepage "https://getartcraft.com/apps/pdfcraft"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "PrintCraft.app"

  uninstall quit: "ai.storyteller.printcraft"
end
