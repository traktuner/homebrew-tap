cask "craft-apps" do
  version :latest
  sha256 :no_check

  url "https://github.com/traktuner/homebrew-tap/archive/refs/heads/master.tar.gz"
  name "Craft Apps"
  desc "Bundle of the seven ArtCraft creative apps"
  homepage "https://getartcraft.com/apps"

  livecheck do
    skip "The bundle follows the versions of its component casks"
  end

  depends_on cask: [
    "traktuner/tap/designcraft",
    "traktuner/tap/effectcraft",
    "traktuner/tap/filmcraft",
    "traktuner/tap/lightcraft",
    "traktuner/tap/pdfcraft",
    "traktuner/tap/photocraft",
    "traktuner/tap/vectorcraft",
  ]
  depends_on :macos

  stage_only true
end
