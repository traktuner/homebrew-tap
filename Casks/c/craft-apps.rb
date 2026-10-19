cask "craft-apps" do
  version :latest
  sha256 :no_check

  url "https://github.com/traktuner/homebrew-tap/archive/refs/heads/master.tar.gz"
  name "Craft Apps"
  desc "Bundle of the fourteen ArtCraft creative apps"
  homepage "https://getartcraft.com/apps"

  livecheck do
    skip "The bundle follows the versions of its component casks"
  end

  depends_on cask: [
    "traktuner/tap/artcraft",
    "traktuner/tap/cadcraft",
    "traktuner/tap/deckcraft",
    "traktuner/tap/designcraft",
    "traktuner/tap/effectcraft",
    "traktuner/tap/figcraft",
    "traktuner/tap/filmcraft",
    "traktuner/tap/gridcraft",
    "traktuner/tap/lightcraft",
    "traktuner/tap/pdfcraft",
    "traktuner/tap/photocraft",
    "traktuner/tap/soundcraft",
    "traktuner/tap/vectorcraft",
    "traktuner/tap/wordcraft",
  ]
  depends_on :macos

  stage_only true
end
