cask "potenad" do
  version "3.0.0"
  sha256 "1c049e1636281155c6255376a858234e856395f90281a811b760bcec90449de8"

  url "https://github.com/PoteNad/potenad/releases/download/v#{version}/PoteNad-#{version}-macOS.dmg"
  name "PoteNad"
  desc "Small native plain-text editor"
  homepage "https://github.com/PoteNad/potenad"

  depends_on macos: :ventura

  app "PoteNad.app"

  zap trash: [
    "~/Library/Application Support/PoteNad",
    "~/Library/Preferences/io.github.PoteNad.potenad.plist",
    "~/Library/Saved Application State/io.github.PoteNad.potenad.savedState",
  ]

  caveats <<~EOS
    If macOS blocks the first launch, try opening PoteNad once and then choose
    Open Anyway in System Settings > Privacy & Security.
  EOS
end
