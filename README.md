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
  <strong>English</strong> •
  <a href="README_zh-TW.md">繁體中文</a> •
  <a href="README_zh-CN.md">简体中文</a>
</p>

---

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> The Problem

Modern AI editors each have their own rules file format:

- Claude Code → `CLAUDE.md`
- Gemini CLI/Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

Updating rules across multiple files manually? **Exhausting.**

---

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> The Solution

**Rules Sync** lets you maintain one master file (e.g., `CLAUDE.md`) and auto-sync to all others:

```
CLAUDE.md ──watch──┬──→ GEMINI.md
                   ├──→ AGENTS.md
                   └──→ .cursor/rules
```

**Save once, sync everywhere.**

---

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

---

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

| Field | Description |
|-------|-------------|
| `source` | Master file name (the one you maintain) |
| `path` | Full path to target file |
| `enabled` | `true` to enable / `false` to disable |
| `note` | Label for display |

---

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> Usage

```bash
# Run in project directory
cd /path/to/your/project
rules-sync .

# Or specify path
rules-sync /path/to/your/project
```

**Output:**

```
📁 Project: /Users/paul/my-project
📄 Watching: /Users/paul/my-project/CLAUDE.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 Change detected, syncing... 22:30:15
   ✓ Antigravity → /Users/paul/my-project/GEMINI.md
   ✓ Codex → /Users/paul/my-project/AGENTS.md
   ✓ Cursor → /Users/paul/my-project/.cursor/rules
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

👀 Watching for changes... (Ctrl+C to stop)
```

---

### <img src="https://api.iconify.design/lucide/terminal.svg?color=%2364748b" width="18" height="18" /> Advanced

**Run in background:**

```bash
nohup rules-sync /path/to/project > /tmp/rules-sync.log 2>&1 &
```

---

### <img src="https://api.iconify.design/lucide/users.svg?color=%238b5cf6" width="18" height="18" /> Contributors

- **Pauuulq87** — Author
- **OpenClaw (Claude)** — Development

---

### <img src="https://api.iconify.design/lucide/heart.svg?color=%23ec4899" width="18" height="18" /> Acknowledgments

Made with care for AI-assisted developers.

*Thanks to all GitHub developers who share their wisdom and experience — you made this possible.*

---

<div align="center">
  <p><strong>MIT License</strong> © 2026 Pauuulq87</p>
</div>
