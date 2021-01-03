# if [ -f "${HOME}/.bashrc" ] ; then
#   source "${HOME}/.bashrc"
# fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/python@3.9/libexec/bin:$HOME/.nodebrew/current/bin:$PATH

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi
MANPATH=${MANPATH:-}:/usr/local/man ; export MANPATH

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

export LANG=ja_JP.UTF-8

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTCONTROL=ignoreboth
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE='&:[ \t]*:fg*:bg*:history*:pwd:exit:ls:cd*'
export HISTSIZE=10000
# history にコマンド実行時刻を記録する
HISTTIMEFORMAT='%Y-%m-%dT%T%z '
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# for SVN
export SVN_EDITOR=vi
