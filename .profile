. ${HOME}/dotfiles/.aliases

if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/python@3.9/libexec/bin:$HOME/.nodenv/bin:$PATH

export HOMEBREW_CACHE=/opt/homebrew/cache

# eval "$(/usr/local/bin/brew shellenv)"
ARCH=$(uname -m)
if [[ $ARCH == arm64 ]]; then
    echo "Current Architecture: $ARCH"
	eval $(/opt/homebrew/bin/brew shellenv)
elif [[ $ARCH == x86_64 ]]; then
    echo "Current Architecture: $ARCH"
	eval $(/usr/local/bin/brew shellenv)
fi
