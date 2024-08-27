#!/bin/zsh
## define your aliases here, along with any zsh-specific options that need to be passed
alias ls='eza --color=always --group-directories-first --icons'; zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
alias grep='\grep --color=auto'
alias pacman='\pacman --color=auto'
alias tree='\tree --dirsfirst -C'
alias dmesg='\dmesg --color=auto --reltime --human --nopager --decode'
alias free='\free -mht'
alias take='[ -d $1 ] || \mkdir -p $1 $$ cd $1'
alias news='goread'
alias fetch="fastfetch -c $HOME/.config/fastfetch/config.jsonrc"
alias mc4d="java -jar $HOME/Games/mc4d-4-3-343.jar"
