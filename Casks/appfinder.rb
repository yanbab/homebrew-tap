cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.12"
  sha256 arm:   "72b07784906885df9ec2646e4edd4ccbf6ab7201665c7924c7c27089569d9657",
         intel: "119c4d06ec402dcec31e21f152aaa2cb2584c7aacc4c86834b628579beb4de0a"

  url "https://github.com/yanbab/appfinder/releases/download/v#{version}/AppFinder-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "AppFinder"
  desc "App store for the Homebrew package manager"
  homepage "https://github.com/yanbab/appfinder"

  auto_updates true
  depends_on macos: :ventura

  app "AppFinder.app"

  postflight_steps do
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
