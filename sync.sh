#!/bin/bash
# Rules Sync - 監聽規則文件變化並同步到多個目標
# https://github.com/Pauuulq87/rules-sync

set -e

# 尋找設定檔
find_config() {
    # 優先順序：當前目錄 > 安裝目錄 > 腳本目錄
    if [ -f "./config.json" ]; then
        echo "./config.json"
    elif [ -f "$HOME/.rules-sync/config.json" ]; then
        echo "$HOME/.rules-sync/config.json"
    elif [ -f "$(dirname "$0")/config.json" ]; then
        echo "$(dirname "$0")/config.json"
    else
        echo ""
    fi
}

CONFIG=$(find_config)

# 檢查設定檔
if [ -z "$CONFIG" ]; then
    echo "❌ 找不到 config.json"
    echo ""
    echo "請建立設定檔："
    echo "  ~/.rules-sync/config.json"
    echo ""
    echo "或複製範例："
    echo "  cp config.example.json ~/.rules-sync/config.json"
    exit 1
fi

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
        echo "❌ 缺少依賴: ${missing[*]}"
        echo ""
        echo "安裝方式："
        echo "  brew install ${missing[*]}"
        exit 1
    fi
}

check_deps

# 取得專案路徑
PROJECT_DIR="${1:-.}"
PROJECT_DIR=$(cd "$PROJECT_DIR" && pwd)
SOURCE_NAME=$(jq -r '.source' "$CONFIG")
SOURCE_FILE="$PROJECT_DIR/$SOURCE_NAME"

if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ 找不到來源文件: $SOURCE_FILE"
    echo ""
    echo "請確認專案目錄中有 $SOURCE_NAME"
    exit 1
fi

echo ""
echo "📁 專案目錄: $PROJECT_DIR"
echo "📄 監聽文件: $SOURCE_FILE"
echo "⚙️  設定檔案: $CONFIG"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# 同步函數
do_sync() {
    echo ""
    echo "🔄 偵測到變化，開始同步... $(date '+%H:%M:%S')"
    
    local synced=0
    
    # 讀取每個 target
    jq -c '.targets[]' "$CONFIG" | while read -r target; do
        enabled=$(echo "$target" | jq -r '.enabled')
        path=$(echo "$target" | jq -r '.path')
        note=$(echo "$target" | jq -r '.note')
        
        if [ "$enabled" = "true" ]; then
            # 確保目標目錄存在
            mkdir -p "$(dirname "$path")" 2>/dev/null || true
            
            if cp "$SOURCE_FILE" "$path" 2>/dev/null; then
                echo "   ✓ $note → $path"
                synced=$((synced + 1))
            else
                echo "   ✗ $note → $path (無法寫入)"
            fi
        fi
    done
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# 先執行一次同步
do_sync

# 開始監聽
echo ""
echo "👀 開始監聽變化... (Ctrl+C 停止)"
echo ""

fswatch -o "$SOURCE_FILE" | while read -r; do
    do_sync
done
