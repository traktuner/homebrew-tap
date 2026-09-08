cask "jdownloader2-safari" do
  version "1.0.2"
  sha256 "e4595027e090b0691d7c0fd2196a944642fe51b6b895261517749abf0bd1de60"

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

  # CI ships an ad-hoc signed app. Re-sign it locally with this Mac's
  # "Apple Development" identity (auto-detected) so Safari loads the extension
  # without "Allow Unsigned Extensions". Entitlements/flags are preserved.
  #
  # These steps run inside the Homebrew cask sandbox, where $HOME points to a
  # temp dir and keychain reads are denied by default. Re-derive the real home
  # from the passwd entry (not $HOME) and re-enable keychain reads via
  # writable_paths. Sign by the identity's SHA-1 hash (second column of
  # `security find-identity`) rather than by name, because multiple
  # development identities can share one display name.
  postflight_steps do
    run "/bin/bash",
        args: ["-c", <<~'BASH'],
          set -euo pipefail
          APP="{{appdir}}/MyJDownloader.app"
          APPEX="$APP/Contents/PlugIns/MyJDownloader Extension.appex"
          REAL_HOME="$(eval echo "~$(id -un)")"
          export HOME="$REAL_HOME"
          OUT="$(/usr/bin/security find-identity -v -p codesigning)"
          # Skip revoked identities: `security find-identity -v` annotates them
          # with "(CSSMERR_TP_CERT_REVOKED)" and codesign would fail with them.
          HASH="$(echo "$OUT" | /usr/bin/awk '/Apple Development/ && !/CSSMERR/ { print $2; exit }')"
          if [ -z "$HASH" ]; then
            echo "No 'Apple Development' code-signing identity found in your keychain."
            exit 1
          fi
          for TARGET in "$APPEX" "$APP"; do
            /usr/bin/codesign --force \
              --preserve-metadata=identifier,entitlements,requirements,flags,runtime \
              --sign "$HASH" "$TARGET"
          done
        BASH
        writable_paths: ["~/Library/Keychains"],
        must_succeed: true, print_stdout: true

    # Homebrew quarantines the downloaded app; the locally re-signed (but not
    # notarized) app would be blocked by Gatekeeper. Clear the quarantine flag
    # now that it's signed with this Mac's own trusted Development identity.
    run "/usr/bin/xattr", args:         ["-dr", "com.apple.quarantine", "{{appdir}}/MyJDownloader.app"],
                          must_succeed: true

    # Launch once so Safari registers the extension.
    run "/usr/bin/open", args: ["{{appdir}}/MyJDownloader.app"], must_succeed: true
  end

  uninstall quit: "org.myjdownloader.MyJDownloader"

  zap trash: [
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader",
    "~/Library/Application Scripts/org.myjdownloader.MyJDownloader.Extension",
    "~/Library/Containers/org.myjdownloader.MyJDownloader",
    "~/Library/Containers/org.myjdownloader.MyJDownloader.Extension",
  ]
end
