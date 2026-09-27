cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.4"
  sha256 arm:   "bd19e6426b904a83993d20236dca5f6a17a1b28a0291390f35032b15400232a8",
         intel: "4f2906e3943ec6c7c627990fb8d8a0df61155a05143c47e39cff493b5990eff9"

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
