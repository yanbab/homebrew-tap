cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.5"
  sha256 arm:   "fb734f843c03e340d22c73acc579af3e909e8313a1818283d01b9afba38fd0a2",
         intel: "bef657883a1a1f458a72ca581b2c53588d4c9066b9a8d8444b2fe2f7c7291682"

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
