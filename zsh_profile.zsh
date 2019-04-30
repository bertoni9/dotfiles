#Virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh # Only for local
#source ~/.local/bin/virtualenvwrapper.sh  # For workstation

# Plugins
plugins=(zsh-autosuggestions)

export HISTCONTROL=ignoredups

# add hostname to right prompt
export RPROMPT='%{$fg[cyan]%}%m%{$reset_color%}'

# Add bold
#zle_highlight=(default:bold)

# ITERMPLOT
export MPLBACKEND="module://itermplot"
#export ITERMPLOT=rv

#ITERM SCROLLING
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Aliases
alias tn="tmux -CC"
alias ta="tmux -CC attach"
alias t0="tmux -CC attach -t 0"
alias t1="tmux -CC attach -t 1"
alias t2="tmux -CC attach -t 2"
alias vi="cd ~/Python/vita/"
alias v1="ssh lorenzo@vita1"
alias v2="ssh lorenzo@vita2"
alias v4="ssh lorenzo@vita4"
alias v100="ssh -A bertoni@10.91.1.25"
alias deac="deactivate"
alias ali="nano ~/.oh-my-zsh/custom/zsh_profile.zsh"
alias ref="source ~/.zshrc"
alias l='ls'
alias cd..="cd .."
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias c='clear'
# Git alias
alias gs='git status'
alias gpush='git push origin master'
alias gpull='git pull origin master'

# Extract

ex () {
   if [ -f "$1" ] ; then
       case "$1" in
           *.tar.bz2)   tar xvjf "$1"    ;;
           *.tar.gz)    tar xvzf "$1"    ;;
           *.bz2)       bunzip2 "$1"     ;;
           *.rar)       unrar x "$1"     ;;
           *.gz)        gunzip "$1"      ;;
           *.tar)       tar xvf "$1"     ;;
           *.tbz2)      tar xvjf "$1"    ;;
           *.tgz)       tar xvzf "$1"    ;;
           *.zip)       unzip "$1"       ;;
           *.Z)         uncompress "$1"  ;;
           *.7z)        7z x "$1"        ;;
           *)           echo "don't know how to extract '$1'... ";;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}
