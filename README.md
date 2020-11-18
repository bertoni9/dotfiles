# Prepare your laptop / workstation

## Install

Zsh should be installed, and then execute

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`


## Make it your default shell 
`chsh -s /usr/bin/zsh`   (still necessary for tmux for example as its default remains bash)

`tmux kill-server (to make sure to restart tmux server)`

If does not work, you can always switch from bash every time with

`exec zsh`


## HPC Clusters (thanks to @svenkreiss)
Changing default shell is often not supported, but you can launch your shell from .bash_profile if you detect you are interactive mode. Only change shell when in interactive mode, otherwise job submission with sbatch will not work. Add at the end of .bash_profile the following (careful about indentation, avoid copy-paste): 

if [[ "$-" == *i* ]]; then
	  export SHELL=/bin/zsh
  	exec /bin/zsh -l
fi

## Plugins
Many plugins are already available, a very useful but missing one is sintax highlighting.

* Add Sintax Highlighting \
`cd ~/.oh-my-zsh/custom/plugins` 

  `git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`


## Make changes effective
Clone this repository and rsync the into the custom folder of oh-my-zsh:
`rsync -av zsh_profle.zsh  ~/.oh-my-zsh/custom/`

Manually change the plugins line in the .zshrc file by substituting it with the following (or the one you like)

*plugins=(git history-substring-search  zsh-syntax-highlighting)*

Many more plugins are available, read more in their [official page](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
