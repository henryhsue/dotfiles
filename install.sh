# create dotfiles in home directory
ln -f -s ~/Personal/dotfiles/.profile ~/.profile
ln -f -s ~/Personal/dotfiles/.vimrc ~/.vimrc
ln -f -s ~/Personal/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/Personal/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/Personal/dotfiles/.zshrc ~/.zshrc # pulls bash .profile


# installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install everything in Brewfile using Homebrew and Cask. Installs neovim.
brew bundle

# zsh
chsh -s $(which zsh)

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# install plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# point neovim's init.vim to ~/.vimrc
mkdir -p ~/.config/nvim/
ln -f -s ~/Personal/dotfiles/init.vim ~/.config/nvim/init.vim # init.vim points to ~/.vimrc

# install plugins
nvim -c PlugInstall

# re-source envs
source ~/.zshrc
