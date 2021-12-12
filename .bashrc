# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

. ~/dotfiles/.functions
. ~/dotfiles/.rc.common

# history control
# 履歴ファイルの指定
export HISTFILE=${HOME}/.bash_history
# 履歴ファイルに保存される履歴の件数
export HISTFILESIZE=100000
export HISTIGNORE='&:[ \t]*:fg*:bg*:history*:pwd:ls:cd*'
HISTTIMEFORMAT='%Y-%m-%dT%T%z '   # 履歴にタイムスタンプを記録する
export HISTCONTROL=ignoredups     # 前と重複する行は記録しない
export HISTCONTROL=ignorespace    # 行頭がスペースのコマンドは記録しない
export HISTCONTROL=ignoreboth     # ignoredups,ignorespaceの両方を設定

# change prompt format
# for bash
# \u -> current user
# @  -> そのまま'@'として表示
# \h -> hostname
# \W -> working directory
export PS1="[\u@\h \W]\$ "
