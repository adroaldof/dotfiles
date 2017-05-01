# Quick Dotfiles

This repo is aimed to make initial setup to a new Ubuntu Machine

## What it does

1. Updates system
1. Install essential packages
1. Install Git
1. Install Tweak Tools
1. Install Curl
1. Install Vim
1. Install VSCode and some extensions
1. Install Atom and some packages
1. Install xClip
1. Install NodeJS, NPM and NVM
1. Install Docker and Docker-Compose
1. Install ZSH and Oh-My-ZSH
1. Install Tmux
1. Install Chrome, Chromium and Opera Browsers
1. Install SQLElectrom
1. Install Spotify

## Execute the script
```bash
sh -c "$(wget://raw.githubusercontent.com/adroaldof/dotfiles/master/setup-machine.sh -O -)"
sh -c "$(wget://raw.githubusercontent.com/adroaldof/dotfiles/master/setup-dotfiles.sh -O -)"
```

## Setup Dotfiles

It will clone the repo and symlink all the following files

1. Add `.tmux.conf` file
1. Add `.vim/` and `.vimrc` configuration
1. Add `.zshrc` file
1. Add `adro.zsh-theme` to `.oh-my-zsh/themes`
1. Install some fonts
1. Intall Vim plugins

## Install

You can test this environment with a Docker container

```bash
git clone git@github.com:adroaldof/dotfiles.git
cd dotfiles
```

To test install [Docker](https://www.docker.com/) and run
```bash
docker build .
docker run -it <container_name> /bin/zsh
```

Setup a new machine
```bash
. ./setup-machine.sh
```

To install the Dotfiles
```bash
. ./setup-dotfiles.sh
```

---
Enjoy :+1:

