#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# エディタ選択
echo "セットアップするエディタを選択してください:"
echo "  1) VS Code"
echo "  2) Cursor"
printf "選択 [1/2]: "
read choice

case "$choice" in
  1)
    EDITOR_NAME="VS Code"
    SETTING_DIR=~/Library/Application\ Support/Code/User
    EDITOR_CMD="code"
    ;;
  2)
    EDITOR_NAME="Cursor"
    SETTING_DIR=~/Library/Application\ Support/Cursor/User
    EDITOR_CMD="cursor"
    ;;
  *)
    echo "Error: 無効な選択です。1 または 2 を入力してください。"
    exit 1
    ;;
esac

echo "${EDITOR_NAME} のセットアップを開始します..."

# シンボリックリンクを作成
rm "$SETTING_DIR/settings.json" 2>/dev/null
ln -s "$SCRIPT_DIR/settings.json" "${SETTING_DIR}/settings.json"
echo "  settings.json をリンクしました"

rm "$SETTING_DIR/keybindings.json" 2>/dev/null
ln -s "$SCRIPT_DIR/keybindings.json" "${SETTING_DIR}/keybindings.json"
echo "  keybindings.json をリンクしました"

# install extension
# CLI コマンドが見つからない場合は、インストール方法を案内して終了
if ! command -v "$EDITOR_CMD" &> /dev/null; then
  echo "Error: '${EDITOR_CMD}' command not found."
  echo "Please install it by:"
  echo "  1. Open ${EDITOR_NAME}"
  echo "  2. Press Cmd+Shift+P"
  echo "  3. Run 'Shell Command: Install '${EDITOR_CMD}' command in PATH'"
  exit 1
fi

cat "$SCRIPT_DIR/extensions" | while read line
do
  "$EDITOR_CMD" --install-extension $line
done

"$EDITOR_CMD" --list-extensions > "$SCRIPT_DIR/extensions"

echo "${EDITOR_NAME} のセットアップが完了しました！"
