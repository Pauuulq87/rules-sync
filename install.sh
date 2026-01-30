#!/bin/bash
# Rules Sync 安裝腳本

set -e

INSTALL_DIR="$HOME/.rules-sync"
BIN_DIR="/usr/local/bin"

echo ""
echo "📦 安裝 Rules Sync..."
echo ""

# 檢查依賴
check_deps() {
    local missing=()
    
    if ! command -v fswatch &> /dev/null; then
        missing+=("fswatch")
    fi
    
    if ! command -v jq &> /dev/null; then
        missing+=("jq")
    fi
    
    if [ ${#missing[@]} -gt 0 ]; then
        echo "⚠️  缺少依賴: ${missing[*]}"
        echo ""
        if command -v brew &> /dev/null; then
            echo "正在安裝..."
            brew install "${missing[@]}"
        else
            echo "請先安裝 Homebrew，然後執行:"
            echo "  brew install ${missing[*]}"
            exit 1
        fi
    fi
}

# 安裝
install() {
    # 建立目錄
    mkdir -p "$INSTALL_DIR"
    
    # 複製文件
    cp sync.sh "$INSTALL_DIR/"
    cp config.json "$INSTALL_DIR/" 2>/dev/null || cp config.example.json "$INSTALL_DIR/config.json"
    
    chmod +x "$INSTALL_DIR/sync.sh"
    
    # 建立 symlink
    if [ -w "$BIN_DIR" ]; then
        ln -sf "$INSTALL_DIR/sync.sh" "$BIN_DIR/rules-sync"
        echo "✅ 已安裝到 $BIN_DIR/rules-sync"
    else
        echo "⚠️  需要 sudo 權限建立指令"
        sudo ln -sf "$INSTALL_DIR/sync.sh" "$BIN_DIR/rules-sync"
        echo "✅ 已安裝到 $BIN_DIR/rules-sync"
    fi
    
    echo ""
    echo "📁 設定檔位置: $INSTALL_DIR/config.json"
    echo ""
    echo "下一步:"
    echo "  1. 編輯 $INSTALL_DIR/config.json 設定同步路徑"
    echo "  2. 執行 rules-sync /path/to/your/project"
    echo ""
}

check_deps
install

echo "🎉 安裝完成！"
