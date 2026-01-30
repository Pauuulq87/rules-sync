<div align="center">
  <h1>🔄 Rules Sync</h1>
  <p><strong>一份規則，多處同步</strong></p>
  <p>維護一份 AI 編輯器規則文件，自動同步到 Cursor、Antigravity、Codex 等多個工具。</p>
</div>

<p align="center">
  <a href="#安裝"><img src="https://img.shields.io/badge/platform-macOS-blue?style=flat-square" alt="Platform"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-green?style=flat-square" alt="License"></a>
  <a href="#使用方式"><img src="https://img.shields.io/badge/shell-bash-orange?style=flat-square" alt="Shell"></a>
</p>

---

## 😫 痛點

現代 AI 編輯器各有各的規則文件格式：

| 工具 | 規則文件 |
|------|----------|
| Claude Code | `CLAUDE.md` |
| Antigravity | `GEMINI.md` |
| Codex | `AGENTS.md` |
| Cursor | `.cursor/rules` |

每次更新規則都要改好幾份？**太累了。**

---

## ✨ 解決方案

**Rules Sync** 讓你只維護一份主文件（如 `CLAUDE.md`），其他文件自動同步：

```
CLAUDE.md ──監聽變化──┬──→ GEMINI.md
                      ├──→ AGENTS.md
                      └──→ .cursor/rules
```

**存檔即同步，零手動操作。**

---

## 🚀 安裝

### 方式一：一鍵安裝

```bash
git clone https://github.com/Pauuulq87/rules-sync.git
cd rules-sync
./install.sh
```

### 方式二：手動安裝

```bash
# 1. 安裝依賴
brew install fswatch jq

# 2. 下載腳本
curl -o ~/.rules-sync/sync.sh https://raw.githubusercontent.com/Pauuulq87/rules-sync/main/sync.sh
chmod +x ~/.rules-sync/sync.sh

# 3. 建立指令
sudo ln -s ~/.rules-sync/sync.sh /usr/local/bin/rules-sync
```

---

## ⚙️ 設定

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

| 欄位 | 說明 |
|------|------|
| `source` | 主文件名稱（你維護的那份）|
| `path` | 目標文件的完整路徑 |
| `enabled` | `true` 啟用 / `false` 停用 |
| `note` | 備註，方便辨識 |

---

## 📖 使用方式

```bash
# 在專案目錄執行
cd /path/to/your/project
rules-sync .

# 或指定專案路徑
rules-sync /path/to/your/project
```

**輸出範例：**

```
📁 專案目錄: /Users/paul/my-project
📄 監聽文件: /Users/paul/my-project/CLAUDE.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 偵測到變化，開始同步... 22:30:15
   ✓ Antigravity → /Users/paul/my-project/GEMINI.md
   ✓ Codex → /Users/paul/my-project/AGENTS.md
   ✓ Cursor → /Users/paul/my-project/.cursor/rules
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

👀 開始監聽變化... (Ctrl+C 停止)
```

---

## 💡 進階用法

### 背景執行

```bash
nohup rules-sync /path/to/project > /tmp/rules-sync.log 2>&1 &
```

### 開機自動啟動（可選）

建立 `~/Library/LaunchAgents/com.rules-sync.plist`：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.rules-sync</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/bin/rules-sync</string>
        <string>/path/to/your/project</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
```

啟用：
```bash
launchctl load ~/Library/LaunchAgents/com.rules-sync.plist
```

---

## 🤝 為什麼需要這個？

如果你同時使用多個 AI 編輯器（Cursor、Claude Code、Antigravity、Codex...），你一定遇過這個問題：

- 更新了 Cursor 的規則，忘了同步到 Claude Code
- 專案切換時，規則文件版本不一致
- 手動複製貼上，浪費時間又容易出錯

**Rules Sync 就是為了解決這個痛點。**

---

## 📄 License

MIT License

---

<div align="center">
  <p>Made with ❤️ for AI-assisted developers</p>
</div>
