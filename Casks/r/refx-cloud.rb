cask "refx-cloud" do
  version "3.1.5"
  sha256 "1a9ba85a983317924bebb2f56c4d7843230f1b390243f22da5719574c1d9d6ef"

  url "https://cloud.refx.com/update/reFX_Cloud_#{version}.pkg"
  name "reFX Cloud Application"
  desc "Software to download reFX plugins and content"
  homepage "https://refx.com/"

  livecheck do
    url "https://cloud.refx.com/update/0/"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :ventura

  pkg "reFX_Cloud_#{version}.pkg"

  uninstall quit:    "com.refx.cloud",
            pkgutil: "com.refx.pkg.reFXCloud"

  zap trash: [
    "~/Library/Application Support/reFX",
    "~/Library/Caches/reFX Cloud",
    "~/Library/Saved Application State/com.refx.cloud.savedState",
  ]
end
