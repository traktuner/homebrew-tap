# Project traps

Acceptance evidence for the MyJDownloader constraints below: on 2026-09-08,
`brew reinstall --cask traktuner/tap/jdownloader2-safari` using tap `b6c8afd`
downloaded the public v1.1.0 release and installed it in `/Applications`.
The installed app and extension passed strict signature and universal-binary
checks, the app had no quarantine attribute, and its exact process remained
running after ten seconds. No certificate was selected and no global protection
setting was changed. This is an existing-Mac installation/startup result; real
Safari/device use and a fresh physical Mac remain unverified. Evidence:
`/Users/thomas/Developer/builds/myjd-safari/1.1.0/brew-verification.md` and
adjacent installation logs. Onyx search/write tools remain unavailable.

- **Do not restore certificate discovery or Keychain sandbox exceptions when merging later MyJDownloader cask migrations.** Upstream `6e6f0ed` migrated `postflight_steps` and skipped revoked identities by hash, but still required an `Apple Development` identity and writable Keychain access. That alternative addresses duplicate names but still fails the certificate-free fresh-Mac requirement. The v1.1.0 cask retains direct ad-hoc signing and app-scoped verification/quarantine steps; unrelated upstream cask changes are preserved. Evidence: the Cask diff from `ec8392a` to `6aa2a8b`, app release `v1.1.0`; actual Brew installation is the acceptance gate. Onyx write remains unavailable.

- **Never auto-select an Apple Development identity for the personal MyJDownloader cask; retain a certificate-free installation path and verify before and after signing.** On 2026-09-08 the first matching local certificate was revoked (`CSSMERR_TP_CERT_REVOKED`), a second certificate shared its display name, and macOS rejected the app signature before moving the app to Trash. The unchanged v1.0.2 release ZIP had a valid ad-hoc signature and matched SHA256 `e4595027e090b0691d7c0fd2196a944642fe51b6b895261517749abf0bd1de60`; the second identity verified successfully, including with preserved requirements, disproving a stale-requirements cause. Current Homebrew requires `postflight_steps` with `run` (failures abort by default). The corrected five certificate-free steps passed on a disposable release copy, including final signature verification and app-scoped quarantine removal. Source: `Casks/j/jdownloader2-safari.rb`, tap `master@ec8392a`, app `main@0ca78fe5614b6aacd69df1b7fa2a66f2ad9f5fef`, evidence `/tmp/myjd-review-j1eo_zv1/`. Onyx search/write tools were unavailable; shared knowledge write remains pending.
