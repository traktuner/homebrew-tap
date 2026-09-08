cask "urbackup-client" do
  version "2.5.30"
  sha256 "f99999633cd7ec5f0885e0f27c799cc9f39f9933d9c8931d106d3c05a5b8287a"

  url "https://hndl.urbackup.org/Client/#{version}/UrBackup%20Client%20#{version}.pkg"
  name "UrBackup Client"
  desc "Client for UrBackup network backup system"
  homepage "https://www.urbackup.org/"

  livecheck do
    url "https://www.urbackup.org/download.html"
    regex(%r{Client/(\d+(?:\.\d+)+)/UrBackup%20Client%20\1\.pkg}i)
  end

  depends_on macos: :big_sur

  pkg "UrBackup Client #{version}.pkg"

  postflight_steps do
    run "/usr/bin/touch",
        args: ["/Library/Application Support/UrBackup Client/var/urbackup/.installed_by_brew"],
        sudo: true, must_succeed: true
  end

  uninstall quit:    "org.urbackup.client",
            script:  {
              executable: "/Library/Application Support/UrBackup Client/uninstall.sh",
              sudo:       true,
            },
            pkgutil: "org.urbackup.client"

  zap trash: [
    "/Library/Application Support/UrBackup Client",
    "/Library/LaunchAgents/org.urbackup.client.plist",
    "/Library/LaunchDaemons/org.urbackup.client.plist",
    "~/Library/Application Support/UrBackup Client",
    "~/Library/Logs/UrBackup Client",
  ]
end
