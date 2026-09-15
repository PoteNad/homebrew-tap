cask "plainst" do
  version "0.1.3"
  sha256 "bb7abaa2e11acd16ba7cfac878e9f7a174fa18a2a9125bb33489484492c36e7a"

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
