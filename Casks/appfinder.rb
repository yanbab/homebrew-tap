cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.13"
  sha256 arm:   "c3d727185af3b66c9bdcf81ff1837b2a1c6a447d0e49aeeaf837a8255783547a",
         intel: "a181a8e5167990b05408832f0699758c26c3d2cc7a4a4be617793e4789dea21f"

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
