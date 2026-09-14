cask "potenad" do
  version "3.0.4"
  sha256 "cd602ea86814659824707ad9096158ad8ebb524ecc8d9a1bb8ed5a82300a9cd5"

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
