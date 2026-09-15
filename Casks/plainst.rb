cask "plainst" do
  version "0.1.4"
  sha256 "8eacc2ced24552d4852a143808312f8b64f643774bf17e4d857530e51e16ab3c"

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
