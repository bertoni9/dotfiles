# Configuration files 
This repository contains the dotfiles and all the information to configure both a local laptop (I use macbook with Iterm2 as terminal) and any remote machine. I use this configuration every day do to research in computer vision and deep learning.

## Prepare your laptop / workstation

### Install Oh My Zsh

Zsh should be installed, and then execute

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`


### Make it your default shell (if not done by Oh My Zsh)
For HPC clusters, it proably won't work, go to the next point.

`chsh -s /usr/bin/zsh`   (still necessary for tmux for example as its default remains bash)

`tmux kill-server (to make sure to restart tmux server)`


### HPC Clusters (thanks to @svenkreiss)
Changing default shell is often not supported, but you can launch your shell from .bash_profile if you detect you are interactive mode. Only change shell when in interactive mode, otherwise job submission with sbatch will not work. 
First, verfy the path of the installed zsh with: \
`which zsh` \
Then add at the end of .bash_profile the following (careful about indentation, avoid copy-paste): 

```
if [[ "$-" == *i* ]]; then
	export SHELL=<zsh_path>
	exec <zsh_path> -l
fi
```


### Plugins
Many plugins are already available, a very useful but missing one is sintax highlighting.

* Add Sintax Highlighting \
`cd ~/.oh-my-zsh/custom/plugins` 

  `git clone git://github.com/zsh-users/zsh-syntax-highlighting.git`


### Make changes effective
Clone this repository and rsync the into the custom folder of oh-my-zsh:
`rsync -av zsh_profle.zsh  ~/.oh-my-zsh/custom/`

Change the line in the .zshrc file that contains the plugins to activate by substituting it with the following (or the one you like)

*plugins=(git history-substring-search  zsh-syntax-highlighting)*

Many more plugins are available, read more in their [official page](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

### SSH Key to Github account
Very helpful to working with Github without typing every time username and password. Steps well explained in the [official website](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)