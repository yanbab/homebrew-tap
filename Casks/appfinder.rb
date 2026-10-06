cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.7"
  sha256 arm:   "443d462d3225ec7af6d631a385c623935fdf48eda9d3fd652974bd5da7773ea5",
         intel: "31cd1aa701dbb055cacf5f38bc414202dc1585a3c740c4183ebcb6ba1fb60ea0"

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
