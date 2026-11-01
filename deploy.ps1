# SoundCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/soundcraft#readme
# 更新日期：2026-11-01
# 类型：binary
$ErrorActionPreference = 'Stop'
Set-Location -Path $PSScriptRoot

if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw '需要先安装 curl（Windows 10+ 自带 curl.exe）' }

New-Item -ItemType Directory -Force -Path .download | Out-Null
Set-Location -Path .download

curl.exe -fL -o soundcraft.msi https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-windows-x64.msi
$h=(Get-FileHash .\soundcraft.msi -Algorithm SHA256).Hash.ToLower()
if ($h -ne "7c0fc9fc783128e5c66deb541d4c9d722d9adf798afc3908fc47b463fe173e1d") { throw "SHA256 校验失败" }
Start-Process msiexec.exe -ArgumentList '/i', "$PWD\soundcraft.msi" -Wait
Write-Host "安装完成：从开始菜单打开 SoundCraft，先载入示例工程试播放"

Write-Host ''

Write-Host '下载与校验完成，安装包在 .download 目录'
Write-Host '若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/soundcraft#readme'
