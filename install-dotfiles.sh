echo "###############################################################################"
echo "# Clone Dotfiles Repo"
echo "###############################################################################"
git clone https://github.com/adroaldof/dotfiles.git ~/dotfiles


echo "###############################################################################"
echo "# Create All Symlinks to Dotfiles"
echo "###############################################################################"
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/vim ~/.vim
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/zshrc ~/.zshrc


echo "###############################################################################"
echo "# Install Fonts"
echo "###############################################################################"
ln -s ~/dotfiles/adro.theme ~/.oh-my-zsh/themes/adro.zsh-theme


echo "###############################################################################"
echo "# Install Fonts"
echo "###############################################################################"
ln -s ~/dotfiles/fonts ~/.fonts
fc-cache -f -v


echo "###############################################################################"
echo "# Install Vundle Bundles"
echo "###############################################################################"
vim +BundleInstall! +qall > /dev/null 2>&1
