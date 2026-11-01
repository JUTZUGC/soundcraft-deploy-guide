#!/usr/bin/env bash
set -euo pipefail
# SoundCraft 一键安装脚本（第三方指南）——按官方文档封装
# 官方文档：https://github.com/storytold/soundcraft#readme
# 更新日期：2026-11-01
# 类型：binary
cd "$(dirname "${BASH_SOURCE[0]}")"

command -v curl >/dev/null 2>&1 || { echo "需要先安装 curl"; exit 1; }

mkdir -p .download
cd .download

curl -fL -o soundcraft.AppImage https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-x86_64.AppImage
echo "107a597fd3f6d45d921047af274e550dedeefb4d7bc8c13ec3688091309f8126  soundcraft.AppImage" | sha256sum -c -
chmod +x soundcraft.AppImage
echo "安装完成：运行 ./soundcraft.AppImage --demo 打开示例工程"

echo ""

echo "下载与校验完成，安装包在 .download 目录"
echo "若结果异常或需要改配置，请参考官方文档：https://github.com/storytold/soundcraft#readme"
