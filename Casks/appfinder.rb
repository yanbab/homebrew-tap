cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.6"
  sha256 arm:   "",
         intel: ""

  url "https://github.com/yanbab/appfinder/releases/download/v#{version}/AppFinder-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "AppFinder"
  desc "App store for the Homebrew package manager"
  homepage "https://github.com/yanbab/appfinder"

  auto_updates true
  depends_on macos: :ventura

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
