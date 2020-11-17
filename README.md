# Prepare your laptop / workstation

## Brew/apt install zsh and install oh my zsh

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

## Make default shell
`chsh -s /usr/bin/zsh`   # (still necessary for tmux for example as its default remains bash)

`tmux kill-server (to make sure to restart tmux server)`

## Plugins
Many plugins are already available, a very useful one is sintax highlighting.

**Add Sintax highlighting** \
`cd ~/.oh-my-zsh/custom/plugins` 

  `git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`


## Make changes effective
Clone this repository and 
Rsync the into the custom folder of oh-my-zsh:
`rsync -av zsh_profle.zsh  ~/.oh-my-zsh/custom/`

Manually change the plugins line in the .zshrc file with 

*plugins=(git history-substring-search  zsh-syntax-highlighting)*
