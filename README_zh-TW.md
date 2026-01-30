<div align="center">
  <h1><img src="https://api.iconify.design/lucide/refresh-cw.svg?color=%236366f1" width="32" height="32" /> Rules Sync</h1>
  <p><strong>一份規則，多處同步。</strong></p>
  <p>維護一份 AI 編輯器規則文件，自動同步到 Cursor、Antigravity、Codex 等多個工具。</p>
</div>

<p align="center">
  <a href="#安裝"><img src="https://img.shields.io/badge/平台-macOS-blue?style=flat-square" alt="Platform"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/授權-MIT-green?style=flat-square" alt="License"></a>
  <a href="#使用方式"><img src="https://img.shields.io/badge/shell-bash-orange?style=flat-square" alt="Shell"></a>
</p>

<p align="center">
  <a href="README.md">English</a> •
  <strong>繁體中文</strong> •
  <a href="README_zh-CN.md">简体中文</a>
</p>

---

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> 痛點

現代 AI 編輯器各有各的規則文件格式：

- Claude Code → `CLAUDE.md`
- Gemini CLI/Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

每次更新規則都要改好幾份？**太累了。**

---

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> 解決方案

**Rules Sync** 讓你只維護一份主文件（如 `CLAUDE.md`），其他文件自動同步：

```
CLAUDE.md ──監聽──┬──→ GEMINI.md
                  ├──→ AGENTS.md
                  └──→ .cursor/rules
```

**存檔即同步，零手動操作。**

---

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

---

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

| 欄位 | 說明 |
|------|------|
| `source` | 主文件名稱（你維護的那份）|
| `path` | 目標文件的完整路徑 |
| `enabled` | `true` 啟用 / `false` 停用 |
| `note` | 備註，方便辨識 |

---

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> 使用方式

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

### <img src="https://api.iconify.design/lucide/terminal.svg?color=%2364748b" width="18" height="18" /> 進階用法

**背景執行：**

```bash
nohup rules-sync /path/to/project > /tmp/rules-sync.log 2>&1 &
```

---


<div align="center">
  <p><strong>MIT License</strong> - 專為 AI 輔助開發者打造。</p>
  <p><em>謝謝 GitHub 開發者把智慧與經驗分享出來，才有今天的我。</em></p>
</div>
