echo "###############################################################################"
echo "# We need sudo do start"
echo "###############################################################################"
sudo echo "I need your permission please"
sudo echo "Thanks. I'll begin the install now"


echo "###############################################################################"
echo "# Generate ssh keys"
echo "###############################################################################"
echo "# Please enter your email:"
read email
ssh-keygen -t rsa -b 4096 -C "$email" -f "/home/$USER/.ssh/id_rsa" -N ""
chmod 600 ~/.ssh/*


echo "###############################################################################"
echo "# Make all system updates"
echo "###############################################################################"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y


echo "###############################################################################"
echo "# Install Essential Packages"
echo "###############################################################################"
sudo apt-get install build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip curl -y


echo "###############################################################################"
echo "# Install Git"
echo "###############################################################################"
sudo apt-get install git -y


echo "###############################################################################"
echo "# Install ZSH and oh-my-zsh"
echo "###############################################################################"
rm -rf ~/.oh-my-zsh 2> /dev/null
rm -rf ~/.zsh* 2> /dev/null
rm -rf ~/.zcomp* 2> /dev/null
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s `which zsh`


echo "###############################################################################"
echo "# Install Tweak Tools"
echo "###############################################################################"
sudo apt-get install gnome-tweak-tool -y


echo "###############################################################################"
echo "# Install vim and its goods"
echo "###############################################################################"
# install vim
sudo apt-get install vim -y

# Install vim copy to clipboard
sudo apt-get install vim-gtk -y

# Install silver search
sudo apt-get install silversearcher-ag -y


echo "###############################################################################"
echo "# Install VSCode"
echo "###############################################################################"
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 > /tmp/vscode.deb
sudo dpkg -i /tmp/vscode.deb && sudo apt-get install -f

# Install some VSCode Extensions
code --Install-extension sort-lines
code --install-extension EditorConfig.EditorConfig
code --install-extension MattiasPernhult.vscode-todo
code --install-extension PeterJausovec.vscode-docker
code --install-extension QassimFarid.ejs-language-support
code --install-extension Shan.code-settings-sync
code --install-extension aeschli.vscode-css-formatter
code --install-extension alefragnani.Bookmarks
code --install-extension christian-kohler.path-intellisense
code --install-extension cssho.vscode-svgviewer
code --install-extension donjayamanne.githistory
code --install-extension eg2.tslint
code --install-extension ms-vscode.PowerShell
code --install-extension ms-vscode.csharp
code --install-extension code-spell-checker
code --install-extension stevencl.addDocComments
code --install-extension vscode-icons
code --install-extension wmaurer.change-case
code --install-extension zhutian.swig


echo "###############################################################################"
echo "# Install Atom"
echo "###############################################################################"
sudo add-apt-repository ppa:webupd8team/atom -y
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
apm install linter-csslint
apm install linter-eslint
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

echo "###############################################################################"
echo "# Install xClip"
echo "###############################################################################"
echo "# Add the follow aliases to your config file"
echo "# alias pbcopy='xclip -selection clipboard'"
echo "# alias pbpaste='xclip -selection clipboard -o'"
# Aliases
# -----
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
sudo apt-get install xclip -y


echo "###############################################################################"
echo "# Install NVM"
echo "###############################################################################"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
echo ". ~/.nvm/nvm.sh" >> ~/.bashrc
echo ". ~/.nvm/nvm.sh" >> ~/.zshrc
source ~/.nvm/nvm.sh
nvm install stable #or nvm install <version>
nvm use stable
n=$(which node);n=${n%/bin/node}; sudo chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

sudo chmod g+w /usr/local/lib/node_modules
sudo chmod g+w /usr/bin/npm
sudo chmod g+w /usr/local/bin/npm


echo "###############################################################################"
echo "# Install Docker"
echo "###############################################################################"
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
# According Docker Docs
# sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
# sudo apt-get install apt-transport-https ca-certificates software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo apt-key fingerprint 0EBFCD88
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# sudo apt-get update
# sudo apt-get install docker-ce
# sudo groupadd docker
# sudo usermod -aG docker $USER
# sudo systemctl enable docker

# According Digital Ocean
# sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
# sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
# sudo apt-get update -y
# sudo apt-cache policy docker-engine
# sudo apt-get install -y docker-engine
# sudo usermod -aG docker $(whoami)
# sudo chmod -aG /usr/bin/docker


echo "###############################################################################"
echo "# Installing Docker Compose"
echo "###############################################################################"
# According Digital Ocean
sudo touch /usr/local/bin/docker-compose && sudo chown $USER /usr/local/bin/docker-compose
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)"
sudo chmod +x /usr/local/bin/docker-compose


echo "###############################################################################"
echo "# Install Tmux"
echo "###############################################################################"
# Aliases
# -----
# alias tmux="tmux -2"
# alias ta="tmux attach -t"
# alias tnew="tmux new -s"
# alias tls="tmux ls"
# alias tkill="tmux kill-session -t"
sudo apt-get install tmux -y


echo "###############################################################################"
echo "# Installing Google Chrome Browser"
echo "###############################################################################"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update -y
sudo apt-get install google-chrome-stable -y


echo "###############################################################################"
echo "# Installing Google Chromium Browser"
echo "###############################################################################"
sudo apt-get install chromium-browser -y


echo "###############################################################################"
echo "# Installing Opera Browser"
echo "###############################################################################"
sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
sudo sh -c 'wget -O - http://deb.opera.com/archive.key | apt-key add -'
sudo apt-get update -y
sudo apt-get install opera-stable -y


echo "###############################################################################"
echo "# Installing Opera Browser"
echo "###############################################################################"
sudo apt-get install opera-developer -y


echo "###############################################################################"
echo "# Install SQLEletrom"
echo "###############################################################################"
sqlectronversion=$(curl -s https://github.com/sqlectron/sqlectron-gui/releases | grep '/sqlectron/sqlectron-gui/releases/tag/' | head -n 1 | awk -F "[><]" '{print $3}' | head -n 2 | sed 's,v,,g')
curl -L "https://github.com/sqlectron/sqlectron-gui/releases/download/v$sqlectronversion/Sqlectron_${sqlectronversion}_amd64.deb" > /tmp/sqlectron.deb
sudo dpkg -i /tmp/sqlectron.deb && sudo apt install -f


echo "###############################################################################"
echo "# Install Spotify"
echo "###############################################################################"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update -y
sudo apt-get install spotify-client -y


echo "###############################################################################"
echo "# Post Install Setups"
echo "###############################################################################"
# Clean packages
sudo apt-get clean -y

# Reduce image size
sudo rm -rf /var/lib/apt/lists/*

# Generate UTF-8 locale
sudo locale-gen en_US en_US.UTF-8

# Reconfigure locales
sudo dpkg-reconfigure locales

echo "###############################################################################"
echo "# "
echo "# Intallation Finish"
echo "# "
echo "# Some useful apps that could be manually installed"
echo "# - Slack (https://slack.com/downloads/linux)"
echo "# - Git Kraken (https://www.gitkraken.com/)"
echo "# "
echo "# And some for fun"
echo "# - MusixMatch (https://about.musixmatch.com/)"
echo "# "
echo "###############################################################################"

