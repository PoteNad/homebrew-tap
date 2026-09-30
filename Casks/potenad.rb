cask "potenad" do
  version "3.0.7"
  sha256 "d95457a1d3c093441fec9b1add4b5d530dc17c3fca17cd0e52de95ffd660ab09"

  url "https://github.com/PoteNad/potenad/releases/download/v#{version}/PoteNad-#{version}-macOS.dmg"
  name "PoteNad"
  desc "Small native plain-text editor"
  homepage "https://github.com/PoteNad/potenad"

  depends_on macos: :ventura

  app "PoteNad.app"

  postflight_steps do
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/PoteNad.app"]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/PoteNad.app"]
  end

  zap trash: [
    "~/Library/Application Support/PoteNad",
    "~/Library/Preferences/io.github.PoteNad.potenad.plist",
    "~/Library/Saved Application State/io.github.PoteNad.potenad.savedState",
  ]
end
