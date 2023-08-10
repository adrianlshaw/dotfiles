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


if [[ $(arch) == "arm64" ]]; then
	export SSH_AUTH_SOCK=$HOME/.sekey/ssh-agent.ssh
	export PATH="/opt/homebrew/bin:$PATH"
fi

FILE="/opt/homebrew/etc/profile.d/bash_completion.sh"
if [ -f $FILE ]; then
	source $FILE 
fi

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
#export BASH_COMPLETION_COMPAT_DIR="/opt/homebrew/etc/bash_completion.d"

export BASH_SILENCE_DEPRECATION_WARNING=1
export PATH=$PATH:/usr/local/texlive/2021/bin/universal-darwin
export SSH_AUTH_SOCK=/Users/adrian/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
. "$HOME/.cargo/env"
export HOMEBREW_NO_ENV_HINTS=1

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/bash_profile.post.bash" ]] && . "$HOME/.fig/shell/bash_profile.post.bash"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Disable bracketed paste mode, which causes characters 
# to append and prepend to pasted content
printf '\e[?2004l'

export _JAVA_OPTIONS="-Djava.net.preferIPv4Stack=true"

