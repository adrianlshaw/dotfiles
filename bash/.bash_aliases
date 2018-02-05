#!/bin/bash
# Platform specific

unamestr=`uname`

source ~/.bash_common

alias vi='vim'

if [[ "$unamestr" == 'Linux' ]]; then
    alias ls='ls -GFh --color=auto'
    alias openhere="nautilus . &"
    alias want="sudo apt-get install"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get upgrade"
    alias remove="sudo apt-get remove"
    alias search="sudo apt-cache search"
    alias battery="acpi"
    alias showdesktop="gsettings set org.gnome.desktop.background show-desktop-icons true"
    alias hidedesktop="gsettings set org.gnome.desktop.background show-desktop-icons false"
    
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias ls='ls -GFh'
    alias gpg="gpg2"
    alias cpu="system_profiler SPHardwareDataType"
    alias record="ffmpeg -r 30 -f avfoundation -capture_cursor 1 -framerate 30 -i '1' -c:v libx264 -crf 0 -x264opts keyint=15:min-keyint=15:scenecut=-1 -preset ultrafast out.mp4"
    alias openhere="open ."
    #alias battery="ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}'"
    alias latexmk="latex-mk"
    alias want="brew install"
    alias remove="brew remove"
    alias update="brew update"
    alias upgrade="brew upgrade"
    alias badge="tput bel" # mark an alert in the terminal
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
    alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
    alias localip="ipconfig getifaddr en1"
    alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
    # Desktop 
    alias ping="prettyping"
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
fi

alias untar="tar -xvf"    
alias mirror="wget -mk"
alias ps="ps aux"
alias sloc="find . -name \"*.c\" -print | xargs wc -l "

# Network tools
alias gateway="route -n get default"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias whois="whois -h whois-servers.net"
alias serve="python -m SimpleHTTPServer 8080"
alias netstat="netstat -l --tcp --udp --unix "

# Navigation
alias c="clear"
alias r="reset"
alias path="pwd"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias sl="ls"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Docker related things
if ! [ -x $(type docker > /dev/null 2>&1) ]; then
	echo "Cool"
	alias linux="docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ubuntu /bin/bash"
	alias delete_alldockercontainers="docker rm $(docker ps -a -q)"
	alias delete_alldockerimages="docker rmi $(docker images -q)"
fi

