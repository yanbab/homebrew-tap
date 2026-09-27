cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.3"
  sha256 arm:   "e09e5975dfec373aa8a311c31a7571bd8f5f05893146c3b8e1f9d581a6504aae",
         intel: "1cfc5feb2d7edb7407189dab0ae1d0247bb497c5c0103f62eb68f23f78559c65"

  url "https://github.com/yanbab/appfinder/releases/download/v#{version}/AppFinder-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "AppFinder"
  desc "App store for the Homebrew package manager"
  homepage "https://github.com/yanbab/appfinder"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "AppFinder.app"

  zap trash: [
    "~/.config/appfinder",
    "~/Library/Application Support/AppFinder",
    "~/Library/Preferences/org.yanbab.appfinder.plist",
    "~/Library/Saved Application State/org.yanbab.appfinder.savedState",
  ]
end
