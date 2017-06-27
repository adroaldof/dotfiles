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
echo "# Install vim and its goods - a898e5792c6179"
echo "###############################################################################"
# install vim
sudo apt-get install vim -y

# Install vim copy to clipboard
sudo apt-get install vim-gtk -y

# Install silver search
sudo apt-get install silversearcher-ag -y


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
echo "# Install NVM and NPM"
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
echo "# Install ZSH and oh-my-zsh"
echo "###############################################################################"
rm -rf ~/.oh-my-zsh 2> /dev/null
rm -rf ~/.zsh* 2> /dev/null
rm -rf ~/.zcomp* 2> /dev/null
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# chsh -s `which zsh`


echo "###############################################################################"
echo "# Remap Caps Lock as a Ctrl"
echo "###############################################################################"
setxkbmap -option "ctrl:nocaps"


echo "###############################################################################"
echo "# Clone Dotfiles Repo"
echo "###############################################################################"
git clone https://github.com/adroaldof/dotfiles.git ~/dotfiles


echo "###############################################################################"
echo "# Create All Symlinks to Dotfiles"
echo "###############################################################################"
rm -rf ~/.gitconfig > /dev/null 2>&1
rm -rf ~/.tmux.conf > /dev/null 2>&1
rm -rf ~/.vim > /dev/null 2>&1
rm -rf ~/.vimrc > /dev/null 2>&1
rm -rf ~/.zshrc > /dev/null 2>&1
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc


echo "###############################################################################"
echo "# Install on-my-zsh theme"
echo "###############################################################################"
rm -rf ~/.oh-my-zsh/themes/adro.zsh-theme > /dev/null 2>&1
ln -s ~/dotfiles/adro.zsh-theme ~/.oh-my-zsh/themes/adro.zsh-theme


echo "###############################################################################"
echo "# Install Fonts"
echo "###############################################################################"
rm -rf ~/.fonts > /dev/null 2>&1
ln -s ~/dotfiles/fonts ~/.fonts
fc-cache -f -v


echo "###############################################################################"
echo "# Install Vundle Bundles"
echo "###############################################################################"
vim +BundleInstall! +qall > /dev/null 2>&1


echo "###############################################################################"
echo "# Reload ZSH"
echo "###############################################################################"
source ~/.zshrc


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

