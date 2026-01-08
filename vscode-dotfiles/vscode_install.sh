#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
# code コマンドが見つからない場合は、インストール方法を案内して終了
if ! command -v code &> /dev/null; then
  echo "Error: 'code' command not found."
  echo "Please install it by:"
  echo "  1. Open VS Code"
  echo "  2. Press Cmd+Shift+P"
  echo "  3. Run 'Shell Command: Install 'code' command in PATH'"
  exit 1
fi

cat "$SCRIPT_DIR/extensions" | while read line
do
  code --install-extension $line
done

code --list-extensions > "$SCRIPT_DIR/extensions"
