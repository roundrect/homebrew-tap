cask "swurl" do
  version "0.0.14"
  sha256 "dc7f71c70da64b1c214b73e0ea5d61dd29a432bc93aa2387cc13a8bf9314b5c0"

  url "https://github.com/roundrect/swurl/releases/download/v#{version}/Swurl-#{version}.dmg"
  name "Swurl"
  desc "Link router: opens each link in the right browser and profile"
  homepage "https://roundrect.download/swurl"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Swurl.app"
  binary "#{appdir}/Swurl.app/Contents/Resources/swurl"

  zap trash: [
    "~/Library/Application Support/Swurl",
    "~/Library/Caches/com.roundrect.swurl.macos",
    "~/Library/Logs/Swurl",
    "~/Library/Preferences/com.roundrect.swurl.macos.plist",
  ]
  # ~/.config/swurl is the person's own config (often a dotfiles repo): never zapped.
end
