cask "microsoft-defender" do
  version "101.26072.0017"
  sha256 "7b6b8c7a0601acffb2fdc957c8ba4ecf2728dbfe57c45c001ba0450e1e8c19c8"

  url "https://res.public.onecdn.static.microsoft/mro1cdnstorage/C1297A47-86C4-4C1F-97FA-950631F94777/MacAutoupdate/Microsoft_Defender_#{version}_Individuals_Installer.pkg"
  name "Microsoft Defender for Endpoint"
  desc "Antivirus software"
  homepage "https://www.microsoft.com/security/business/endpoint-security/microsoft-defender-endpoint"

  livecheck do
    url "https://aka.ms/MacDefender"
    regex(/Microsoft[._-]Defender[._-]v?(\d+(?:\.\d+)+)/i)
    strategy :header_match
  end

  auto_updates true
  depends_on cask: "microsoft-auto-update"
  depends_on macos: :sonoma

  pkg "Microsoft_Defender_#{version}_Individuals_Installer.pkg",
      choices: [
        {
          "choiceIdentifier" => "com.microsoft.package.Microsoft_AutoUpdate.app",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
      ]

  postflight_steps do
    run "/bin/bash",
        args: ["-c", "~/Library/'Mobile Documents'/com~apple~CloudDocs/config/microsoft-defender/" \
                     "MicrosoftDefenderATPOnboardingMacOs.sh"],
        sudo: true, must_succeed: true
  end

  uninstall quit:    "com.microsoft.autoupdate2",
            script:  {
              executable: "/Library/Application Support/Microsoft/Defender/uninstall/uninstall",
              sudo:       true,
            },
            pkgutil: [
              "com.microsoft.dlp.agent",
              "com.microsoft.dlp.daemon",
              "com.microsoft.dlp.ux",
            ]

  zap trash: [
    "~/Library/Group Containers/*com.microsoft.wdav/MicrosoftDefender.sqlite*",
    "~/Library/Logs/Microsoft/Defender",
  ]
end
