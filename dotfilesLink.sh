#!/bin/sh
dir=$(cd $(dirname $0) && pwd)

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

# detect bash | zsh
if [ -n "${BASH_VERSION-}" ]; then
  create_homedir_symlink .profile .bash_profile
  create_homedir_symlink .bashrc
else
  create_homedir_symlink .profile .zprofile
  create_homedir_symlink .zshrc
fi

for file in .??*
do
  [[ "$file" == ".git" ]] && continue
  [[ "$file" == ".commons" ]] && continue
  [[ "$file" == ".profile" ]] && continue
  [[ "$file" == ".bashrc" ]] && continue
  [[ "$file" == ".zshrc" ]] && continue
  create_homedir_symlink $file
done
