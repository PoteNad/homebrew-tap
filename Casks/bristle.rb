cask "bristle" do
  version "0.1.1"
  sha256 "359597dac089e9f18d4e2ae8f0d7620886e7a5bfcac492f7820512b06d626388"

  url "https://github.com/PoteNad/bristle/releases/download/v#{version}/Bristle-#{version}-macOS.dmg"
  name "Bristle"
  desc "Small native drawing app where everything stays editable"
  homepage "https://github.com/PoteNad/bristle"

  depends_on macos: :ventura

  app "Bristle.app"

  postflight_steps do
    run "/usr/bin/codesign",
        args: ["--verify", "--deep", "--strict", "{{appdir}}/Bristle.app"]
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Bristle.app"]
  end

  zap trash: [
    "~/Library/Preferences/io.github.PoteNad.bristle.plist",
    "~/Library/Saved Application State/io.github.PoteNad.bristle.savedState",
  ]
end
