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

Windows(PowerShell, Node.js 20 이상: `winget install OpenJS.NodeJS.LTS`):

```powershell
irm https://raw.githubusercontent.com/xo0449/homebrew-tap/main/install-pomoya-cli.ps1 | iex
```
