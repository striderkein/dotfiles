# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

. ~/dotfiles/.functions
. ~/dotfiles/.rc.common

# 履歴にフォーマットを反映させるには t オプションおよび書式指定が必要なのでエイリアスを設定しておく
alias history='history -t %Y-%m-%dT%T%z '
# history control
# 履歴ファイルの指定
export HISTFILE=${HOME}/.zsh_history
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
HISTORY_IGNORE='(fg*|bg*|pwd|ls|cd*)'
setopt EXTENDED_HISTORY           # 履歴にタイムスタンプを記録する
setopt HIST_IGNORE_DUPS           # 前と重複する行は記録しない
setopt HIST_IGNORE_ALL_DUPS       # 履歴中の重複行をファイル記録前に無くす
setopt HIST_IGNORE_SPACE          # 行頭がスペースのコマンドは記録しない
setopt HIST_FIND_NO_DUPS          # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS         # 余分な空白は詰めて記録
setopt HIST_NO_STORE              # histrory コマンドは記録しない

# change prompt format
# for zsh
# PROMPT="%n@%m %% "
# RPROMPT="[%~]"

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST
PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# for anyenv
eval "$(anyenv init -)"

