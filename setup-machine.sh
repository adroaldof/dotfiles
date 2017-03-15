##############################################################################
# Generate ssh keys
###############################################################################
# ssh-keygen -t rsa -b 4096 -C "your@email.com"
# chmod 600 ~/.ssh/*
echo "********************************************************************************"
echo ""


###############################################################################
# Make all updates
###############################################################################
echo "Updating system"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y


###############################################################################
# Install Essential Packages
###############################################################################
echo "Installing essentials packages"
sudo apt-get install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip -y


###############################################################################
# Install Git
###############################################################################
echo "Installing Git"
sudo apt-get install git-core -y


###############################################################################
# Install Tweak Tools
###############################################################################
echo "Installing Tweak Tools"
sudo apt-get install gnome-tweak-tool -y


###############################################################################
# Install Curl
###############################################################################
echo "Installing Curl"
sudo apt install curl -y


###############################################################################
# Install vim
###############################################################################
echo "Installing Vim and its goods"
# install vim
sudo apt-get install vim -y

# Install vim copy to clipboard
sudo apt-get install vim-gtk -y

# Install silver search
sudo apt-get install silversearcher-ag -y


###############################################################################
# Install VSCode
###############################################################################
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > /tmp/vscode.deb
sudo dpkg -i /tmp/vscode.deb && sudo apt-get install -f

# Install some VSCode Extensions
code --install-extension aeschli.vscode-css-formatter
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension cssho.vscode-svgviewer
code --install-extension donjayamanne.githistory
code --install-extension EditorConfig.EditorConfig
code --install-extension eg2.tslint
code --install-extension MattiasPernhult.vscode-todo
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.PowerShell
code --install-extension PeterJausovec.vscode-docker
code --install-extension QassimFarid.ejs-language-support
code --install-extension seanmcbreen.Spell
code --install-extension Shan.code-settings-sync
code --install-extension stevencl.addDocComments
code --install-extension wmaurer.change-case
code --install-extension zhutian.swig


###############################################################################
# Install Atom
###############################################################################
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update -y
sudo apt-get install atom -y

# Install some Atom Packages
apm install atom-beautify
apm install atom-typescript
apm install atom-visual-studio-code-ui
apm install color-picker
apm install editorconfig
apm install file-icons
apm install git-plus
apm install highlight-selected
apm install language-docker
apm install language-html-swig
apm install language-nginx
apm install linter
apm install linter-eslint
apm install linter-csslint
apm install linter-scss-lint
apm install minimap
apm install minimap-cursorline
apm install minimap-find-and-replace
apm install minimap-git-diff
apm install minimap-highlight-selected
apm install minimap-linter
apm install minimap-selection
apm install minimap-split-diff
apm install react
apm install split-diff
apm install sync-settings
apm install tabs-to-spaces
apm install terminal-panel
apm install todo-show
apm install visual-studio-dark-syntax
apm install webbox-color

###############################################################################
# Install xClip
###############################################################################
echo "Installing xClip"
echo "Add the follow aliases to your config file"
echo "alias pbcopy='xclip -selection clipboard'"
echo "alias pbpaste='xclip -selection clipboard -o'"
# Aliases
# -----
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
sudo apt-get install xclip -y


###############################################################################
# Install NVM
###############################################################################
echo "Installing NVM"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
source ~/.profile
nvm install stable
npm i -g git-x


###############################################################################
# Install Docker
###############################################################################
echo "Installing Docker"
# Install docker
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo usermod -aG docker $(whoami)
sudo chmod -aG /usr/bin/docker

echo "Installing Docker Compose"
# Install docker-compose
sudo touch /usr/local/bin/docker-compose && sudo chown $USER /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


###############################################################################
# Install ZSH and oh-my-zsh
###############################################################################
echo "Installing ZSH and Oh-my-zsh"
sudo apt-get install zsh -y
sh -c "$(wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh)"
chsh -s `which zsh`


###############################################################################
# Install Tmux
###############################################################################
echo "Installing Tmux"
# Aliases
# -----
# alias tmux="tmux -2"
# alias ta="tmux attach -t"
# alias tnew="tmux new -s"
# alias tls="tmux ls"
# alias tkill="tmux kill-session -t"
sudo apt-get install tmux -y


###############################################################################
# Install Browsers
###############################################################################
echo "Installing Google Chrome"
# Install Google Chrome Browser
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y

echo "Installing Google Chromium"
# Install Chromium Browser
sudo apt-get install chromium-browser -y

echo "Installing Opera"
# Install Opera browser
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update -y
sudo apt-get install opera -y


###############################################################################
# Install SQLEletrom
###############################################################################
echo "Installing SQLEletrom"
curl -L https://github.com/sqlectron/sqlectron-gui/releases/download/v1.17.0/Sqlectron-1.20.0.deb > /tmp/sqlectron.deb
sudo dpkg -i /tmp/sqlectron.deb && sudo apt install -f


###############################################################################
# Install Spotify
###############################################################################
echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client


###############################################################################
# Install Slack
###############################################################################
https://downloads.slack-edge.com/linux_releases/slack-desktop-2.4.2-amd64.deb > /tmp/slack.deb
sudo dpkg -i /tmp/slack.deb && sudo apt install -f

###############################################################################
# Post Install Setups
###############################################################################
# Clean packages
sudo apt-get clean

# Reduce image size
rm -rf /var/lib/apt/lists/*

# Generate UTF-8 locale
locale-gen en_US en_US.UTF-8

# Reconfigure locales
dpkg-reconfigure locales

