#!/bin/bash
# Platform specific

unamestr=`uname`

alias vi='vim'
alias diff='diff --color=auto'
alias gdb="gdb -q"

if [[ "$SHELL" == "/bin/bash" ]]; then
	source ~/.bash_common
fi

if [[ "$unamestr" == 'Linux' ]]; then
    alias open='xdg-open'
    alias sudo='sudo '
    alias ls='ls -GFh --color=auto'
    alias delete-broken-symlinks='find . -xtype l -delete'
    alias openhere="nautilus . &"
    alias want="sudo apt-get install"
    alias update="sudo apt-get update"
    alias upgrade="sudo apt-get upgrade"
    alias remove="sudo apt-get remove"
    alias search="sudo apt-cache search"
    alias battery="acpi"
    alias n="gnome-terminal 2&1 > /dev/null &"
    alias showdesktop="gsettings set org.gnome.desktop.background show-desktop-icons true"
    alias hidedesktop="gsettings set org.gnome.desktop.background show-desktop-icons false"
    alias restartgnomeshell="killall -SIGQUIT gnome-shell"
    source ~/.bash_banner
elif [[ "$unamestr" == 'Darwin' ]]; then
    alias ls='ls -GFh'
    alias cpu="system_profiler SPHardwareDataType"
    alias record="ffmpeg -r 30 -f avfoundation -capture_cursor 1 -framerate 30 -i '1' -c:v libx264 -crf 0 -x264opts keyint=15:min-keyint=15:scenecut=-1 -preset ultrafast out.mp4"
    alias openhere="open ."
    #alias battery="ioreg -l | grep -i capacity | tr '\n' ' | ' | awk '{printf("%.2f%%\n", $10/$5 * 100)}'"
    #alias battery="ioreg -l | grep Capacity | cut -d '"' -f2,3 | grep "CurrentCapacity\|MaxCapacity" | grep -v 'Apple' | awk '{ printf $3 "} | tr '\n' ' ' | awk '{ printf $2/$1*100 "%" }'"
    alias latexmk="latex-mk"
    alias want="brew install"
    alias ncdu="ncdu --color dark"
    alias remove="brew remove"
    alias update="brew update"
    alias upgrade="brew upgrade"
    alias x86shell="arch -x86_64 /bin/bash"
    alias badge="tput bel" # mark an alert in the terminal
    alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
    alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
    alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
    alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"
    # Desktop 
    alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
    alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
    sleep-in() {
       echo "Sleeping laptop in $1 minutes..." && sleep $((60 * $1)) && pmset sleepnow
    }
fi
alias pkill="pkill -e -f"
alias lynx="lynx -cfg=~/.lynxrc"
alias q="exit"
alias untar="tar -xvf"    
alias mirror="wget -mk"
alias ps="ps aux"
alias sloc="find . -name \"*.c\" -print | xargs wc -l "
alias d='docker'
alias grep='grep --color=auto'
alias grpe='grep --color=auto'
alias tmux="tmux attach || tmux new"

# Network tools
alias localip="ifconfig | grep inet | grep broadcast | awk '{ printf( $2 "\n") }'"
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

alias hstat="curl -o /dev/null --silent --head --write-out '%{http_code}\n'" $1

