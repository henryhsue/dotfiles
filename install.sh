# create dotfiles in home directory
ln -f -s ~/Personal/dotfiles/.profile ~/.profile
ln -f -s ~/Personal/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/Personal/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/Personal/dotfiles/.gitconfig ~/.gitconfig

# install everything in Brewfile using Homebrew and Cask
brew bundle

# zsh
chsh -s $(which zsh)

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
