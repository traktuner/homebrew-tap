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

## PdfCraft releases contain the PrintCraft bundle

- **Constraint:** Keep the requested `pdfcraft` token, but use the published `printcraft-<version>-macos-universal.dmg`, `PrintCraft.app`, and `ai.storyteller.printcraft`. Inferring the artifact or bundle from the token causes a missing download or app artifact. This affects `Casks/p/pdfcraft.rb`.

**Stable key:** `craft-pdfcraft-bundle-contract`.
**Evidence:** GitHub `storytold/pdfcraft` release `v0.2.1`; the downloaded DMG's `Info.plist`; tagged `packaging/macos/package.sh` and `packaging/macos/Info.plist.in`.
**Rejected hypothesis:** `PdfCraft.app` and a `pdfcraft-0.2.1-macos-universal.dmg` asset match the token. The release asset list and downloaded DMG disprove this assumption.
**Status:** Verified. Repository: `traktuner/homebrew-tap`; branch: `master`; implementation base: `6aa2a8b49ba40d50dc6acc1b6c5ffff8d883273b`; publication base: `35dcf11feccf374043c077e3e8add8f016a09cd0`. Tags: `cask`, `github-releases`, `pdfcraft`, `bundle-name`.

## Pending Onyx synchronization — Craft casks

**Namespace:** `homebrew-tap`.
**Stable handoff key:** `craft-casks-release-integration`.
**Repository:** `traktuner/homebrew-tap`; branch: `master`; implementation base: `6aa2a8b49ba40d50dc6acc1b6c5ffff8d883273b`; publication base: `35dcf11feccf374043c077e3e8add8f016a09cd0`.
**Onyx search status:** No Onyx tools were exposed. Two MCP initialization attempts at `https://onyx.oncloud.at/mcp` returned HTTP 404. No search executed successfully.
**Onyx write status:** Remote writes were unavailable and did not execute. This section preserves pending context locally.

**Decision:** Use versioned universal DMGs from each application's GitHub Releases, pinned SHA-256 values, `strategy :github_latest`, an anchored numeric version regex, and `auto_updates true`. Preserve the seven requested tokens. Add all seven tokens to `.github/autobump.txt` so the existing scheduled workflow includes them.
**Context and alternatives:** The user requires release downloads, livecheck, and the auto-update flag. Git tags can include RCs and versions without installers. Unversioned latest URLs would lose reproducible downloads. Separate architecture assets are unnecessary because every published macOS DMG is universal. The GitHub latest strategy consumes API quota but follows the installable release channel.
**Evidence paths:** `Casks/{d,e,f,l,p,v}/*craft.rb`, `.github/autobump.txt`, `.github/workflows/autobump.yml`, and upstream `/repos/storytold/<app>/releases/latest`. Primary Homebrew guidance: `https://docs.brew.sh/Brew-Livecheck` and `https://docs.brew.sh/Cask-Cookbook`.

**Completed state:** Seven Casks use release versions PhotoCraft 0.3.0, VectorCraft 0.4.0, FilmCraft 0.2.1, LightCraft 0.2.1, PdfCraft/PrintCraft 0.2.1, EffectCraft 0.4.0, and DesignCraft 0.2.1. All seven downloads succeeded. Their calculated SHA-256 values match GitHub digests. Inspection of the decompressed DMGs confirms app names, bundle identifiers, versions, and macOS 11.0 minima.
**Verification:** `/tmp/verify-craft-casks.py` failed for all seven missing Cask files before implementation, then passed for all seven after implementation. It compares definitions against release metadata and downloaded hashes. It also rejects RC/beta/nightly tags and checks autobump membership. `/tmp/verify-craft-dmgs.py` passed for all seven downloaded disk images. `git diff --check` passed. The temporary scripts and downloads are session evidence, not versioned assets.
**Remaining checks and blockers:** This Linux environment has neither Homebrew nor Ruby. `brew style`, `brew audit`, `brew livecheck`, and a real macOS install/launch were not run. No dependencies were installed. The owner authorized commit and push. Publish from a separate worktree based on current origin/master to preserve local files and newer remote documentation.
**Exact next actions:** When Onyx is available, search this namespace for the two stable keys above. Upsert the decision/handoff as `craft-casks-release-integration`. Record trap `craft-pdfcraft-bundle-contract` remotely with its local evidence and status. On a Mac with this trusted tap, run `brew style` on the seven new files. Run `brew audit --cask traktuner/tap/<token>` and `brew livecheck --cask traktuner/tap/<token>` for each token. Verify installation and launch of the seven apps on the owner's Mac when requested.
**Workflow decision:** The existing workflow has schedule and workflow_dispatch triggers. A push alone does not run it. After publication, dispatch autobump.yml at master with only the seven requested Cask tokens. Preserve the trigger configuration. Evidence: .github/workflows/autobump.yml.
**Tags:** `cask`, `craft-apps`, `github-releases`, `livecheck`, `autobump`, `pending-onyx-sync`.
