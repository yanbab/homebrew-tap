cask "appfinder" do
  arch arm: "arm64", intel: ""

  version "0.9.11"
  sha256 arm:   "112741969de10e34da73c429ba64bcb3d67468162cf356a02bd3b5b2c2173d33",
         intel: "4d91de2432f8f1f1693e6d80f67e855f2ef44c3aaca1e3a607a53089e9536d48"

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
