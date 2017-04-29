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
echo "# Install Fonts"
echo "###############################################################################"
rm -rf ~/.oh-my-zsh/themes/adro.zsh-theme > /dev/null 2>&1
ln -s ~/dotfiles/adro.theme ~/.oh-my-zsh/themes/adro.zsh-theme


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
