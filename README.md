<div align="center">
  <h1><img src="https://api.iconify.design/lucide/refresh-cw.svg?color=%236366f1" width="32" height="32" /> Rules Sync</h1>
  <p><strong>One source, multiple destinations.</strong></p>
  <p>Maintain a single AI editor rules file and auto-sync to Cursor, Antigravity, Codex, and more.</p>
</div>

<p align="center">
  <a href="#installation"><img src="https://img.shields.io/badge/platform-macOS-blue?style=flat-square" alt="Platform"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="License"></a>
  <a href="#usage"><img src="https://img.shields.io/badge/shell-bash-orange?style=flat-square" alt="Shell"></a>
</p>

<p align="center">
  <a href="#english">English</a> •
  <a href="#繁體中文">繁體中文</a> •
  <a href="#简体中文">简体中文</a>
</p>

---

## English

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> The Problem

Modern AI editors each have their own rules file format:

- Claude Code → `CLAUDE.md`
- Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

Updating rules across multiple files manually? **Exhausting.**

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> The Solution

**Rules Sync** lets you maintain one master file (e.g., `CLAUDE.md`) and auto-sync to all others:

```
CLAUDE.md ──watch──┬──→ GEMINI.md
                   ├──→ AGENTS.md
                   └──→ .cursor/rules
```

**Save once, sync everywhere.**

### <img src="https://api.iconify.design/lucide/download.svg?color=%236366f1" width="18" height="18" /> Installation

**Option 1: One-liner**

```bash
git clone https://github.com/Pauuulq87/rules-sync.git
cd rules-sync
./install.sh
```

**Option 2: Manual**

```bash
# Install dependencies
brew install fswatch jq

# Download and install
curl -o ~/.rules-sync/sync.sh https://raw.githubusercontent.com/Pauuulq87/rules-sync/main/sync.sh
chmod +x ~/.rules-sync/sync.sh
sudo ln -s ~/.rules-sync/sync.sh /usr/local/bin/rules-sync
```

### <img src="https://api.iconify.design/lucide/settings.svg?color=%23f59e0b" width="18" height="18" /> Configuration

Edit `~/.rules-sync/config.json`:

```json
{
  "source": "CLAUDE.md",
  "targets": [
    {
      "path": "/Users/yourname/project/GEMINI.md",
      "enabled": true,
      "note": "Antigravity"
    },
    {
      "path": "/Users/yourname/project/AGENTS.md",
      "enabled": true,
      "note": "Codex"
    },
    {
      "path": "/Users/yourname/project/.cursor/rules",
      "enabled": true,
      "note": "Cursor"
    }
  ]
}
```

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> Usage

```bash
# Run in project directory
cd /path/to/your/project
rules-sync .

# Or specify path
rules-sync /path/to/your/project
```

### <img src="https://api.iconify.design/lucide/users.svg?color=%238b5cf6" width="18" height="18" /> Contributors

- **Pauuulq87** — Author
- **OpenClaw (Claude)** — Development

### <img src="https://api.iconify.design/lucide/heart.svg?color=%23ec4899" width="18" height="18" /> Acknowledgments

Made with care for AI-assisted developers.

*Thanks to all GitHub developers who share their wisdom and experience — you made this possible.*

---

## 繁體中文

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> 痛點

現代 AI 編輯器各有各的規則文件格式：

- Claude Code → `CLAUDE.md`
- Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

每次更新規則都要改好幾份？**太累了。**

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> 解決方案

**Rules Sync** 讓你只維護一份主文件（如 `CLAUDE.md`），其他文件自動同步：

```
CLAUDE.md ──監聽──┬──→ GEMINI.md
                  ├──→ AGENTS.md
                  └──→ .cursor/rules
```

**存檔即同步，零手動操作。**

### <img src="https://api.iconify.design/lucide/download.svg?color=%236366f1" width="18" height="18" /> 安裝

**方式一：一鍵安裝**

```bash
git clone https://github.com/Pauuulq87/rules-sync.git
cd rules-sync
./install.sh
```

**方式二：手動安裝**

```bash
# 安裝依賴
brew install fswatch jq

# 下載並安裝
curl -o ~/.rules-sync/sync.sh https://raw.githubusercontent.com/Pauuulq87/rules-sync/main/sync.sh
chmod +x ~/.rules-sync/sync.sh
sudo ln -s ~/.rules-sync/sync.sh /usr/local/bin/rules-sync
```

### <img src="https://api.iconify.design/lucide/settings.svg?color=%23f59e0b" width="18" height="18" /> 設定

編輯 `~/.rules-sync/config.json`：

```json
{
  "source": "CLAUDE.md",
  "targets": [
    {
      "path": "/Users/你的名字/專案/GEMINI.md",
      "enabled": true,
      "note": "Antigravity"
    },
    {
      "path": "/Users/你的名字/專案/AGENTS.md",
      "enabled": true,
      "note": "Codex"
    },
    {
      "path": "/Users/你的名字/專案/.cursor/rules",
      "enabled": true,
      "note": "Cursor"
    }
  ]
}
```

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> 使用方式

```bash
# 在專案目錄執行
cd /path/to/your/project
rules-sync .

# 或指定專案路徑
rules-sync /path/to/your/project
```

### <img src="https://api.iconify.design/lucide/users.svg?color=%238b5cf6" width="18" height="18" /> 貢獻者

- **Pauuulq87** — 作者
- **OpenClaw (Claude)** — 開發

### <img src="https://api.iconify.design/lucide/heart.svg?color=%23ec4899" width="18" height="18" /> 致謝

專為 AI 輔助開發者打造。

*謝謝 GitHub 開發者把智慧與經驗分享出來，才有今天的我。*

---

## 简体中文

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> 痛点

现代 AI 编辑器各有各的规则文件格式：

- Claude Code → `CLAUDE.md`
- Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

每次更新规则都要改好几份？**太累了。**

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> 解决方案

**Rules Sync** 让你只维护一份主文件（如 `CLAUDE.md`），其他文件自动同步：

```
CLAUDE.md ──监听──┬──→ GEMINI.md
                  ├──→ AGENTS.md
                  └──→ .cursor/rules
```

**保存即同步，零手动操作。**

### <img src="https://api.iconify.design/lucide/download.svg?color=%236366f1" width="18" height="18" /> 安装

**方式一：一键安装**

```bash
git clone https://github.com/Pauuulq87/rules-sync.git
cd rules-sync
./install.sh
```

**方式二：手动安装**

```bash
# 安装依赖
brew install fswatch jq

# 下载并安装
curl -o ~/.rules-sync/sync.sh https://raw.githubusercontent.com/Pauuulq87/rules-sync/main/sync.sh
chmod +x ~/.rules-sync/sync.sh
sudo ln -s ~/.rules-sync/sync.sh /usr/local/bin/rules-sync
```

### <img src="https://api.iconify.design/lucide/settings.svg?color=%23f59e0b" width="18" height="18" /> 配置

编辑 `~/.rules-sync/config.json`：

```json
{
  "source": "CLAUDE.md",
  "targets": [
    {
      "path": "/Users/你的名字/项目/GEMINI.md",
      "enabled": true,
      "note": "Antigravity"
    },
    {
      "path": "/Users/你的名字/项目/AGENTS.md",
      "enabled": true,
      "note": "Codex"
    },
    {
      "path": "/Users/你的名字/项目/.cursor/rules",
      "enabled": true,
      "note": "Cursor"
    }
  ]
}
```

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> 使用方式

```bash
# 在项目目录执行
cd /path/to/your/project
rules-sync .

# 或指定项目路径
rules-sync /path/to/your/project
```

### <img src="https://api.iconify.design/lucide/users.svg?color=%238b5cf6" width="18" height="18" /> 贡献者

- **Pauuulq87** — 作者
- **OpenClaw (Claude)** — 开发

### <img src="https://api.iconify.design/lucide/heart.svg?color=%23ec4899" width="18" height="18" /> 致谢

专为 AI 辅助开发者打造。

*谢谢 GitHub 开发者把智慧与经验分享出来，才有今天的我。*

---

<div align="center">
  <p><strong>MIT License</strong> © 2026 Pauuulq87</p>
</div>
