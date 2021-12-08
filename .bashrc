# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

. ./.commons/.functions


# change prompt format
# for bash
# \u -> current user
# @  -> そのまま'@'として表示
# \h -> hostname
# \W -> working directory
export PS1="[\u@\h \W]\$ "
