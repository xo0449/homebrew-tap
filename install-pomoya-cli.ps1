# 뽀모야 터미널(pomoya-cli) Windows 설치. PowerShell에서:
#   irm https://raw.githubusercontent.com/xo0449/homebrew-tap/main/install-pomoya-cli.ps1 | iex
# 관리자 권한 없이 %LOCALAPPDATA%\Programs\pomoya-cli 에 풀고 사용자 PATH에 더한다. 다시 돌리면 새 버전으로 바꾼다
$ErrorActionPreference = 'Stop'
$version = '0.3.2'

$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
  Write-Host 'Node.js가 필요해요. 아래를 실행한 뒤 새 터미널에서 다시 해 주세요:' -ForegroundColor Yellow
  Write-Host '  winget install OpenJS.NodeJS.LTS'
  return
}
$major = [int]((& node -v).TrimStart('v').Split('.')[0])
if ($major -lt 20) {
  Write-Host "Node.js 20 이상이 필요해요(지금 $(& node -v)). winget upgrade OpenJS.NodeJS.LTS" -ForegroundColor Yellow
  return
}

$dir = Join-Path $env:LOCALAPPDATA 'Programs\pomoya-cli'
$zip = Join-Path $env:TEMP "pomoya-cli-$version-windows.zip"
$url = "https://github.com/xo0449/homebrew-tap/releases/download/pomoya-cli-$version/pomoya-cli-$version-windows.zip"
Write-Host "뽀모야 터미널 $version 받는 중…"
Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
$tmp = Join-Path $env:TEMP "pomoya-cli-$version"
if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
Expand-Archive -Path $zip -DestinationPath $env:TEMP -Force
if (Test-Path $dir) { Remove-Item $dir -Recurse -Force }
New-Item -ItemType Directory -Path (Split-Path $dir) -Force | Out-Null
Move-Item -Path $tmp -Destination $dir
Remove-Item $zip -Force

$path = [Environment]::GetEnvironmentVariable('Path', 'User')
if (-not (($path -split ';') -contains $dir)) {
  [Environment]::SetEnvironmentVariable('Path', ($(if ($path) { "$path;" } else { '' }) + $dir), 'User')
}
$env:Path = "$env:Path;$dir"
Write-Host "설치했어요: $dir" -ForegroundColor Green
Write-Host '이제 pomoya login 으로 로그인하고 pomoya 로 시작해요. (다른 터미널 창은 새로 열어야 pomoya 명령이 잡혀요)'
Write-Host 'Windows Terminal에서 쓰면 그림과 색이 제대로 보여요.'
