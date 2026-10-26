# xo0449/homebrew-tap

[뽀모야(Pomoya)](https://www.pomoya.page/) Homebrew 탭.

```sh
brew install --cask xo0449/tap/pomoya
```

설치되는 파일은 [pomoya-site Release](https://github.com/xo0449/pomoya-site/releases)의 Mac dmg와 같다. 업데이트는 앱이 스스로 한다.

## pomoya-cli

터미널에서 쓰는 뽀모야(맥·리눅스·Windows).

```bash
brew install xo0449/tap/pomoya-cli
pomoya login
pomoya
```

Windows는 [Scoop](https://scoop.sh)으로(이 저장소가 Scoop 버킷도 겸한다, `bucket/`). Node.js는 Scoop이 같이 깐다:

```powershell
scoop bucket add xo0449 https://github.com/xo0449/homebrew-tap
scoop install pomoya-cli
```

새 버전은 `scoop update pomoya-cli`. Scoop 없이 깔려면(Node.js 20 이상 필요):

```powershell
irm https://raw.githubusercontent.com/xo0449/homebrew-tap/main/install-pomoya-cli.ps1 | iex
```
