echo "###############################################################################"
echo "# We need sudo do start"
echo "###############################################################################"
sudo echo "I need your permission please"
sudo echo "Thanks. I'll begin the install now"


echo "###############################################################################"
echo "# Make all system updates"
echo "###############################################################################"
sudo apt-get update -y
sudo apt-get upgrade -y


echo "###############################################################################"
echo "# Install Git"
echo "###############################################################################"
sudo apt-get install git -y


echo "###############################################################################"
echo "# Install vim and its goods"
echo "###############################################################################"
# install neovim
sudo apt-get install neovim -y

# Install silver search
sudo apt-get install silversearcher-ag -y

# Clone vim configs
git clone https://github.com/adroaldof/nvim.git ~/.config/nvim


echo "###############################################################################"
echo "# Install Docker"
echo "###############################################################################"
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER


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
echo "# Install ZSH and oh-my-zsh"
echo "###############################################################################"
rm -rf ~/.oh-my-zsh 2> /dev/null
rm -rf ~/.zsh* 2> /dev/null

sudo apt-get install zsh -y
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


echo "###############################################################################"
echo "# "
echo "# Done... Now you are ready to go. Cheers..."
echo "# "
echo "###############################################################################"

