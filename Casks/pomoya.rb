cask "pomoya" do
  version "0.3.7"
  sha256 "0c556ba92ff02fcd7cb286211a9244b29f41f4d16ece82c637ac6517a2327750"

  url "https://github.com/xo0449/pomoya-site/releases/download/v#{version}/Pomoya_#{version}_universal.dmg",
      verified: "github.com/xo0449/pomoya-site/"
  name "Pomoya"
  name "뽀모야"
  desc "Pomodoro focus timer with a pixel pet that lives in your menu bar"
  homepage "https://www.pomoya.page/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # 앱이 스스로 새 버전을 받아 바꾼다(사이트판과 같은 파일). brew upgrade는 --greedy일 때만 건드린다
  auto_updates true
  depends_on macos: ">= :sequoia"

  app "Pomoya.app"

  zap trash: [
    "~/Library/Application Support/com.pomoya.app",
    "~/Library/Caches/com.pomoya.app",
    "~/Library/HTTPStorages/com.pomoya.app",
    "~/Library/Preferences/com.pomoya.app.plist",
    "~/Library/WebKit/com.pomoya.app",
  ]
end
