#
# ~/.bashrc
#

# If not running interactively, don't do anything
if [ -f ~/.profile ]; then
	. ~/.profile
fi
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
exec fish
