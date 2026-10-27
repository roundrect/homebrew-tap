cask "shorty" do
  version "0.2.27"
  sha256 "aae9b58113715a98ad52802afe8f3d4a509a4fa3ba0b6ce45a7b3f4787405707"

  url "https://github.com/roundrect/shorty/releases/download/v#{version}/Shorty-#{version}.dmg"
  name "Shorty"
  desc "Manage menu keyboard shortcuts and app hotkeys from one file"
  homepage "https://github.com/roundrect/shorty"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Shorty.app"
  binary "#{appdir}/Shorty.app/Contents/Resources/shorty"

  uninstall quit:       "com.roundrect.shorty.macos",
            login_item: "Shorty"

  zap trash: [
    "~/Library/Application Support/Shorty",
    "~/Library/Preferences/com.roundrect.shorty.macos.plist",
  ]

  caveats <<~EOS
    Shorty lives in the menu bar. Open it once to set up your shortcuts, or from a terminal:
      shorty import --write && shorty sync

    Removing Shorty does not remove the shortcuts it set in other apps. To do that first:
      shorty clear --yes
  EOS
end
