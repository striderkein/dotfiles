. ~/dotfiles/common/aliases

if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/python@3.9/libexec/bin:$HOME/.nodebrew/current/bin:$PATH

export HOMEBREW_CACHE=/opt/homebrew/cache
