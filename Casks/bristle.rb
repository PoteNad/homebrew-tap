cask "bristle" do
  version "0.1.2"
  sha256 "9eb8491557debfd22d870fb1c79626fc189795656a65d96f75107c0cfa0b5744"

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
