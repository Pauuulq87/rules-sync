<div align="center">
  <h1><img src="https://api.iconify.design/lucide/refresh-cw.svg?color=%236366f1" width="32" height="32" /> Rules Sync</h1>
  <p><strong>一份规则，多处同步。</strong></p>
  <p>维护一份 AI 编辑器规则文件，自动同步到 Cursor、Antigravity、Codex 等多个工具。</p>
</div>

<p align="center">
  <a href="#安装"><img src="https://img.shields.io/badge/平台-macOS-blue?style=flat-square" alt="Platform"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/许可-MIT-green?style=flat-square" alt="License"></a>
  <a href="#使用方式"><img src="https://img.shields.io/badge/shell-bash-orange?style=flat-square" alt="Shell"></a>
</p>

<p align="center">
  <a href="README.md">English</a> •
  <a href="README_zh-TW.md">繁體中文</a> •
  <strong>简体中文</strong>
</p>

---

### <img src="https://api.iconify.design/lucide/alert-circle.svg?color=%23ef4444" width="18" height="18" /> 痛点

现代 AI 编辑器各有各的规则文件格式：

- Claude Code → `CLAUDE.md`
- Gemini CLI/Antigravity → `GEMINI.md`
- Codex → `AGENTS.md`
- Cursor → `.cursor/rules`

每次更新规则都要改好几份？**太累了。**

---

### <img src="https://api.iconify.design/lucide/sparkles.svg?color=%2322c55e" width="18" height="18" /> 解决方案

**Rules Sync** 让你只维护一份主文件（如 `CLAUDE.md`），其他文件自动同步：

```
CLAUDE.md ──监听──┬──→ GEMINI.md
                  ├──→ AGENTS.md
                  └──→ .cursor/rules
```

**保存即同步，零手动操作。**

---

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

---

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

| 字段 | 说明 |
|------|------|
| `source` | 主文件名称（你维护的那份）|
| `path` | 目标文件的完整路径 |
| `enabled` | `true` 启用 / `false` 停用 |
| `note` | 备注，方便辨识 |

---

### <img src="https://api.iconify.design/lucide/play.svg?color=%2322c55e" width="18" height="18" /> 使用方式

```bash
# 在项目目录执行
cd /path/to/your/project
rules-sync .

# 或指定项目路径
rules-sync /path/to/your/project
```

**输出示例：**

```
📁 项目目录: /Users/paul/my-project
📄 监听文件: /Users/paul/my-project/CLAUDE.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔄 检测到变化，开始同步... 22:30:15
   ✓ Antigravity → /Users/paul/my-project/GEMINI.md
   ✓ Codex → /Users/paul/my-project/AGENTS.md
   ✓ Cursor → /Users/paul/my-project/.cursor/rules
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

👀 开始监听变化... (Ctrl+C 停止)
```

---

### <img src="https://api.iconify.design/lucide/terminal.svg?color=%2364748b" width="18" height="18" /> 进阶用法

**后台执行：**

```bash
nohup rules-sync /path/to/project > /tmp/rules-sync.log 2>&1 &
```

---


### <img src="https://api.iconify.design/lucide/heart.svg?color=%23ec4899" width="18" height="18" /> 致谢

专为 AI 辅助开发者打造。

*谢谢 GitHub 开发者把智慧与经验分享出来，才有今天的我。*

---

<div align="center">
  <p><strong>MIT License</strong></p>
</div>
