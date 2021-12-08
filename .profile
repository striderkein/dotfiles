. ./.commons/.aliases

if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/python@3.9/libexec/bin:$HOME/.nodebrew/current/bin:$PATH

export HOMEBREW_CACHE=/opt/homebrew/cache

export LANG=ja_JP.UTF-8

export HISTCONTROL=ignoreboth
export HISTIGNORE='&:[ \t]*:fg*:bg*:history*:pwd:exit:ls:cd*'
export HISTSIZE=10000
HISTTIMEFORMAT='%Y-%m-%dT%T%z '
