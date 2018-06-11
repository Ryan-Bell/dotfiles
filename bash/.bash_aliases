#!/bin/bash
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias lls='ls -lah --color=auto'
alias du='du -h'

# Use neovim instead of vim
alias vim='nvim'

# One letter command for a simple to-do list from Steve Losh (makes lots of cool things)
# See: https://github.com/sjl/t
alias t='python ~/bin/t --task-dir ~/.tasks --list tasks'

# Git wrapper from the github team that adds some nice features
# See: https://github.com/github/hub
alias git='hub'

# Kill all orphaned packages
alias anakin="sudo pacman -Rns \$(pacman -Qtdq)"

# Quick movement
alias ~='cd ~'
alias ..='cd ../'
alias ...='cd ../../'
alias sl='ls'

# Startup rainbowstream (commandline twitter client) docker container
alias rainbowstream='docker run -it --rm -v /etc/localtime:/etc/localtime:ro -v $HOME/.rainbow_oauth:/root/.rainbow_oauth -v $HOME/.rainbow_config.json:/root/.rainbow_config.json --name rainbowstream jess/rainbowstream'
alias twitter='rainbowstream'

# Openvpn docker to run other containers through
# TODO: currently needs NordVPN DNS servers set in /etc/resolv.conf but this is not automatic
alias opendocker='docker build -t vpn ~/Documents/dockerfiles/openvpn/; sudo docker run --rm -it -m 4G --cap-add=NET_ADMIN --device /dev/net/tun --name vpn -v /home/mainuser/Documents/dockerfiles/openvpn-configs/ovpn_tcp:/vpn vpn'

# Run transmission through vpn container network
# Local connection through vpn ip (via docker inspect)
alias transmission='docker run --rm -it -m 4G --net container:vpn --name transmission -e PUID=1000 -e PGID=1000 -v /media/raid/transmission/:/var/lib/transmission-daemon -d dperson/transmission'

# Create directory paths and cd into them in one command
chdir(){
	mkdir -p "$1"
	cd "$1"
}

# poor way of trying to correct some command git command mistypes (gi tstatus)
gi() {
	if [[ $@ == "tpull" ]]; then
		command git pull
	elif [[ $@ == "tstatus" ]]; then
		command git status
	elif [[ $@ == "tpush" ]]; then
		command git push
	else
		echo "what man?"
	fi
}
