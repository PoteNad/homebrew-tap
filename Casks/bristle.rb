cask "bristle" do
  version "0.1.0"
  sha256 "8a0bceba33d9c061cea40c0755cd19a9e7f3717a6a01455bf4c41df272e7acac"

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
