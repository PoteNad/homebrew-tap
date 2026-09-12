cask "potenad" do
  version "3.0.0"
  sha256 "1c049e1636281155c6255376a858234e856395f90281a811b760bcec90449de8"

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

  caveats <<~EOS
    PoteNad is not Apple-notarized. This cask verifies the app bundle and removes
    its quarantine attribute so it can open normally after installation.
  EOS
end
