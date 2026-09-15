cask "plainst" do
  version "0.1.2"
  sha256 "edfe7f65a00d7cdd1d1a95c0c8990d6b3ad6960d3c9a95b2fe39522b6cf222d6"

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
