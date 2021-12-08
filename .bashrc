# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias ls='ls -la'
alias pwcl='pwd | pbcopy'
# for Docker
alias fig='docker-compose'
# node.js
alias nodeps='ps -e | grep node | awk '\''{print $1}'\'''
function nodekill() { kill -9 $1; }


# change prompt format
# for bash
# \u -> current user
# @  -> そのまま'@'として表示
# \h -> hostname
# \W -> working directory
export PS1="[\u@\h \W]\$ "

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
