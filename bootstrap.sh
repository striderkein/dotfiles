#!/bin/sh
dir=$(cd $(dirname $0) && pwd)

# detect bash | zsh
is_bash() {
  if [ -n "${BASH_VERSION-}" ]; then
    # bash
    true
  else
    # not bash
    false
  fi
}

download_git_completion() {
  curl -o git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
}

deploy_git_completion() {
  mkdir -p ~/.zsh && cd $_
  if [ ! -e git-prompt.sh ] && [ ! -e git-completion.sh ] && [ ! -e _git ]; then
    download_git_completion
  fi
}

create_homedir_symlink() {
  local basepath=$dir/$1
  if [ -z $basepath ]; then
    return
  fi

  # 第２引数で出力ファイル名変更可能
  local outname=$2
  if [ -z $outname ]; then
    local outname=$1
  fi

  local outpath=~/$outname
  if [ -e $outpath ]; then
    return
  fi

  ln -sfnv $basepath $outpath
}

install_dotfiles() {
  if is_bash; then
    create_homedir_symlink .profile .bash_profile
    create_homedir_symlink .bashrc
  else
    create_homedir_symlink .profile .zprofile
    create_homedir_symlink .zshrc
  fi

  for dotfile in .??*
  do
    [[ "$dotfile" == ".git" ]] && continue
    [[ "$dotfile" == ".profile" ]] && continue
    [[ "$dotfile" == ".bashrc" ]] && continue
    [[ "$dotfile" == ".zshrc" ]] && continue
    create_homedir_symlink $dotfile
  done
}

install_dotfiles
deploy_git_completion
