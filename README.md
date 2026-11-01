# SoundCraft 一键安装指南

> 第三方部署指南 · 非 SoundCraft 官方仓库。官方项目：[storytold/soundcraft](https://github.com/storytold/soundcraft)
> 内容来自官方文档（2026-11-01）。项目迭代快，请以[官方文档](https://github.com/storytold/soundcraft#readme)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> DAW 不该只有大厂能做：开源、纯 Rust、桌面和浏览器同一套代码，每个操作都能从命令行调。

⚠️ Windows、macOS、Linux、FreeBSD 都有安装包，浏览器版也能直接用。Linux 从源码构建要先装 ALSA 头文件（Debian/Ubuntu 是 libasound2-dev），源码构建需要较新的 Rust 工具链。音频要接声卡或 ASIO 设备，虚拟机里可能没有可用输出。安装包未签名时系统会拦一次。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/soundcraft-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会按系统下载安装包并比对 SHA256，装完打开示例工程确认能出声，按它的提示确认即可，结束时它会告诉你结果。
   （下载地址与校验方式以官方文档为准。）



## SoundCraft 是什么？

SoundCraft 是开源的多轨录音、剪辑、混音加 MIDI 都做进一个原生应用，桌面与浏览器同一套代码，还能用命令行脚本化（协议：Apache-2.0，<img src="https://img.shields.io/github/stars/storytold/soundcraft?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

完整的数字音频工作站：多轨录音与剪辑、带插件与发送的调音台、自动化曲线、MIDI 编辑与导出，桌面端原生运行，另提供浏览器版与命令行接口。

- 纯 Rust 原生：桌面与浏览器共用一套核心
- 功能完整：多轨、混音、插件、发送、自动化
- MIDI 与录音：编辑、导出、往返都能做
- 可脚本化：每个操作都能从命令行或 agent 调
- 四平台安装包 + 浏览器版
- Apache-2.0，可商用可二开

（来源：[官方仓库](https://github.com/storytold/soundcraft)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 4.0k stars 10 月新项目 | — |
| 纯 Rust 原生 | 桌面与浏览器共用核心 |
| 多轨、混音、插件、自动化功能齐全 | — |
| 四平台安装包 | Release 提供校验文件 |
| 可用命令行脚本化 | 便于自动化 |
| Apache-2.0 | 可商用可二开 |

| 需要注意 | 说明 |
|---|---|
| 名称搜索竞争较高（164 条） | — |
| Linux 源码构建要装 ALSA 头文件 | — |
| 需要真实音频设备 | 虚拟机受限 |
| 插件生态不如老牌 DAW | — |
| 项目很新 | 工程文件格式仍可能变 |

> 以上基于官方文档与社区反馈整理（2026-11-01），以官方最新文档为准。

## 官方安装方式（可手动执行）

```bash
curl -fL -o soundcraft.AppImage https://github.com/storytold/soundcraft/releases/download/v0.15.0/soundcraft-0.15.0-linux-x86_64.AppImage
echo "107a597fd3f6d45d921047af274e550dedeefb4d7bc8c13ec3688091309f8126  soundcraft.AppImage" | sha256sum -c -
chmod +x soundcraft.AppImage
echo "安装完成：运行 ./soundcraft.AppImage --demo 打开示例工程"
```

安装包来源：[https://github.com/storytold/soundcraft/releases/latest](https://github.com/storytold/soundcraft/releases/latest)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认四平台安装包、源码构建与 ALSA 依赖 | 已核对 2026-11-01 |
| Release v0.15.0 的 SHA256SUMS.txt 已下载核对（Windows 与 Linux） | 已核对 2026-11-01 |
| 未实测安装与音频播放 | 说明 2026-11-01 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-11-01 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-11-01 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

项目本身不含 MCP，但提供命令行接口可被 agent 调用；本仓库的 MCP 只提供安装步骤、版本说明与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-11-01）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\soundcraft-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 安装包对照（v0.15.0）

| 平台 | 文件 | 大小 |
|---|---|---|
| Windows x64 | soundcraft-0.15.0-windows-x64.msi | — |
| Windows x64 便携版 | soundcraft-0.15.0-windows-x64-portable.zip | — |
| Windows ARM64 / x86 | 对应 msi 与便携包 | — |
| macOS 通用 | soundcraft-0.15.0-macos-universal.dmg | — |
| Linux x64 | soundcraft-0.15.0-linux-x86_64.AppImage / .deb | 18.7 / 20.1 MB |
| Linux ARM64 / RISC-V | AppImage / deb / rpm / flatpak | — |
| FreeBSD | tar.gz | — |

Release 里带 `SHA256SUMS.txt`，可一次核对全部文件。

## 从源码构建

```bash
cargo run --release -p soundcraft -- --demo
```

Linux 需要先装 ALSA 头文件：Debian / Ubuntu 是 `libasound2-dev`，Fedora 是 `alsa-lib-devel`。

## 注意

- 音频输出需要可用的声卡或 ASIO 设备，虚拟机里可能没有
- 首次运行建议用 `--demo` 载入示例工程，确认能播
- 插件兼容性取决于格式，别直接拿商业工程的插件链迁移
- 浏览器版适合试听与轻量编辑，重活仍建议桌面端
- Apache-2.0，二次分发保留声明

## 常见坑

- Windows 安装被 SmartScreen 拦：核对 SHA256 后仍报，选仍要运行
- AppImage 打不开：先 chmod +x，缺 FUSE 用 --appimage-extract
- 没有声音：在设置里选对输出设备，Linux 检查 PipeWire / PulseAudio
- 源码构建报 ALSA 缺失：按发行版装 alsa 开发包
- 插件加载失败：确认插件格式受支持，先排除可疑插件
- 工程打不开：版本差异导致，回退到创建时的版本
- 浏览器版卡顿：改用桌面端处理大工程

## 免责声明

本仓库为第三方指南，与 SoundCraft 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-11-01），项目迭代快，请以[官方文档](https://github.com/storytold/soundcraft#readme)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
