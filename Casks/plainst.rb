cask "plainst" do
  version "0.1.6"
  sha256 "2f32b1d71f809a2521cf5808b2531ed5b432b6239e7804d1fe0427dd524c638c"

  url "https://github.com/PoteNad/plainst/releases/download/v#{version}/Plainst-#{version}-macOS.dmg"
  name "Plainst"
  desc "Small native Typst editor for prose and math"
  homepage "https://github.com/PoteNad/plainst"

  depends_on macos: :ventura

  app "Plainst.app"

  postflight_steps do
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/Plainst.app"]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Plainst.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.github.PoteNad.plainst.plist",
    "~/Library/Saved Application State/io.github.PoteNad.plainst.savedState",
  ]
end
