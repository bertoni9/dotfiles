
# MacBook and Servers Configuration
This repository contains the dotfiles and all the information to configure both a local laptop (I use macbook with Iterm2 as terminal) and remote Linux machines. When not specified differently, instructions have to be repeated locally and remotely.

## Mac - Install HomeBrew and Git

`xcode-select —-install`
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`


## Mac - Install Iterm2

`brew cask install iterm2`

### Miscellaneous packages
`brew install rynsc git`

A nice tip from https://github.com/svenkreiss/dotfiles is to save iterm iterm2 preferences in a custom folder (or use the ones provided). To load them: preferences --> general --> preferences (pointing at `dotfiles/iterm2` for example).
Similarly, you can load the profiles  `dotfiles/iterm2/Profiles.json` into Preferences --> profiles.

## All - Install Oh My Zsh
Install zsh with: 
`brew install zsh` (for mac)

Oh My Zsh:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`


To make it your default shell:

`chsh -s /usr/bin/zsh`

### Plugins
Many plugins are already available, I use:

- History-Substring-search

 `git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search`

- Sintax Highlighting

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

### Forward SSH Key
To avoid creating a new SSH in each remote machine, we can forward the agent when we ssh by changing the ssh settings
`touch ~/.ssh/config`
and then copy the following:
```
Host *
    IdentityFile ~/.ssh/id_ed25519
    ForwardAgent yes
    UseKeychain yes
    AddKeysToAgent yes
```

### HPC Clusters
Thanks to @svenkreiss.

Changing default shell may not be supported, but you can launch your shell from .bash_profile if you detect you are interactive mode. Only change shell when in interactive mode, otherwise job submission with sbatch will not work. 
First, verfy the path of the installed zsh with: \
`which zsh` \
Then add at the end of .bash_profile the following (careful about indentation, avoid copy-paste): 

```
if [[ "$-" == *i* ]]; then
	export SHELL=<zsh_path>
	exec <zsh_path> -l
fi
```


##  All - Make changes effective
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

## All - SSH Key to Github account
Very helpful to working with Github without typing every time username and password. Steps well explained in the [official website](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account)

If you already have a repository with https url (always asking for username and password), after setting a ssh key: \
`git remote set-url origin <ssh-url>`

## Mac - Install Python3
As Python2 is used as default in the system, it's convenient to use **pyenv** to set the right Python version.

```
brew install pyenv
pyenv install 3.8.10
pyenv global 3.8.10
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
 ```