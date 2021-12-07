# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Aliases
#
# switch profiles according to connection destination
# alias ssh='~/bin/ssh-change-profile.sh'
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
alias ls='ls -la'
alias pwcl='pwd | pbcopy'
# for SVN
alias svnl='svnl'
function svnl() { svn log -v -l $1; }
# for Docker
alias fig='docker-compose'
# node.js
alias nodeps='ps -e | grep node | awk '\''{print $1}'\'''
function nodekill() { kill -9 $1; }

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#

# change prompt format
# for zsh
# PROMPT="%n@%m %% "
# RPROMPT="[%~]"

# general perpose
# rename arg1 to arg2 recursively
# thx: https://qiita.com/shuhei/items/cf1ddf373d1f83d5d667
renamer() { find . -name "*$1*" | xargs rename -s $1 $2; }

# for Git/GitHub
# cf. https://neos21.hatenablog.com/entry/2018/07/19/080000
gcd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# カレントブランチから$1ブランチへのPullRequestを開く
# cf. https://kang.hateblo.jp/entry/2018/12/01/133651
function opr() {
  parentBranch=$1
  currentBranch=`git branch | grep "*"`
  repoName=$(git remote show origin -n | ruby -ne 'puts /^\s*Fetch.*:(.*).git/.match($_)[1] rescue nil')

  open -a /Applications/Google\ Chrome.app  https://github.com/${repoName/* /}/compare/${parentBranch/* /}...${currentBranch/* /}
}

export HOMEBREW_CACHE=/opt/homebrew/cache

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
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '
