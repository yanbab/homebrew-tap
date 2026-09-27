cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.3"
  sha256 arm:   "32426ce9f94db52c1ac2d6f0af231407e5c8e88f9d2f6b46817c06168a49a467",
         intel: "76210c968d6136e07b145b83caf1c0b669be842e4faf6310c10724f527b8ace6"

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
