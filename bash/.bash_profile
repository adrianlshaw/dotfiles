# Primarily for use on Mac OS X
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

if [ -f ~/.bash_aliases ]; then
	    . ~/.bash_aliases
fi

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export HOMEBREW_NO_ANALYTICS=1

#if [ -x "$(type gpg-connect-agent)" ]; then
#	export SSH_AUTH_SOCK=$(gpg-connect-agent "getinfo ssh_socket_name" /bye | head -n 1 | cut -d ' ' -f 2)
#fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

alias linux="docker run -ti --rm ubuntu"
if [ -e /home/user/.nix-profile/etc/profile.d/nix.sh ]; then . /home/user/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -f ~/.cargo/env ]; then
source "$HOME/.cargo/env"
fi

source ~/.bash_common

if [[ $(arch) == "arm64" ]]; then
	export SSH_AUTH_SOCK=$HOME/.sekey/ssh-agent.ssh
	export PATH="/opt/homebrew/bin:$PATH"
fi

FILE="/opt/homebrew/etc/profile.d/bash_completion.sh"
if [ -f $FILE ]; then
	source $FILE 
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
