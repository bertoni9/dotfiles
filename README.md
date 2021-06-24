
# MacBook and Servers Configuration
This repository contains the dotfiles and all the information to configure both a local laptop (I use macbook with Iterm2 as terminal) and remote Linux machines. When not specified differently, instructions have to be repeated locally and remotely.

## Install HomeBrew and Git

`xcode-select —-install`
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


## Install Iterm2 (for Mac)

`brew cask install iterm2`

A nice tip from https://github.com/svenkreiss/dotfiles is to save iterm iterm2 preferences in a custom folder (or use the ones provided). To load them: preferences --> general --> preferences (pointing at `dotfiles/iterm2` for example).
Similarly, you can load the profiles  `dotfiles/iterm2/Profiles.json` into Preferences --> profiles.

## Install Oh My Zsh
Install zsh with: 
`brew install zsh`

Oh My Zsh:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`


To make it your default shell:

`chsh -s /usr/bin/zsh`


### HPC Clusters
Thanks to @svenkreiss.

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


## Plugins
Many plugins are already available, I use:

- History-Substring-search

 `git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search`

- Sintax Highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

## Make changes effective
Clone this repository and rsync the into the custom folder of oh-my-zsh:
```
git clone git@github.com:bertoni9/dotfiles.git
rsync -av dotfiles/zsh_profile.zsh  ~/.oh-my-zsh/custom/
```

Change the line in the .zshrc file that contains the plugins to activate by substituting it with the following (or the one you like)

`nano ~/.zshrc`

And add:
*plugins=(git history-substring-search  zsh-syntax-highlighting)*

Many more plugins are available, read more in their [official page](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)

## SSH Key to Github account
Very helpful to working with Github without typing every time username and password. Steps well explained in the [official website](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

If you already have a repository with https url (always asking for username and password), after setting a ssh key: \
`git remote set-url origin <ssh-url>`
