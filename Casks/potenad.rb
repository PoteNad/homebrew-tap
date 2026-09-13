cask "potenad" do
  version "3.0.2"
  sha256 "27f041df511455525fa2c9247539d8d7754af6f0b5100c9ad45e14688075c68e"

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
