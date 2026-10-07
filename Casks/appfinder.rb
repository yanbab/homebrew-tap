cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.9"
  sha256 arm:   "b540de8120c24b10f100fb38041d21be8e860688f0dcb23463509490f5c800c1",
         intel: "321a55e6d789d00e7bc7c2bf2c1f8f2a3c48844bf29198adb99bd0d7af8194fe"

  url "https://github.com/yanbab/appfinder/releases/download/v#{version}/AppFinder-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "AppFinder"
  desc "App store for the Homebrew package manager"
  homepage "https://github.com/yanbab/appfinder"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "AppFinder.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/AppFinder.app"]
  end

  zap trash: [
    "~/.config/appfinder",
    "~/Library/Application Support/AppFinder",
    "~/Library/Preferences/org.yanbab.appfinder.plist",
    "~/Library/Saved Application State/org.yanbab.appfinder.savedState",
  ]
end
