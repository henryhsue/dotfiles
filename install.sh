# create dotfiles in home directory
ln -f -s ~/Personal/dotfiles/.profile ~/.profile
ln -f -s ~/Personal/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/Personal/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/Personal/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/Personal/dotfiles/.zshrc ~/.zshrc

# installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install everything in Brewfile using Homebrew and Cask. Installs neovim.
brew bundle

# zsh
chsh -s $(which zsh)

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
neovim -c PlugInstall
