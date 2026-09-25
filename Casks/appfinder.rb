cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.1"
  sha256 arm:   "5af5030b0e2c8cdd3e57e0e0a81c083fe91ac7814893de8799b82f32e4e4929e",
         intel: "a7885246c14d26b6584e7bbd69894555650cb1cdbec00595c957cd074da9b353"

  url "https://github.com/yanbab/appfinder/releases/download/v#{version}/AppFinder-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "AppFinder"
  desc "Software library for macOS"
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
