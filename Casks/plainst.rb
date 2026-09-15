cask "plainst" do
  version "0.1.5"
  sha256 "87c4c95a114035f34782c1f309907f0bbbc6c51e8733ea3a79f0142da14d8d1c"

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
