install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor

use zsh
rm -vf ~/.zshrc
ln -vs ~/.dotfiles/.zshrc ~/.zshrc

rm -vrf ~/.oh-my-zsh
ln -vs ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh

chsh -s `which zsh`
/usr/bin/env zsh


echo "init vim..."
rm -vf ~/.vimrc
ln -vs ~/.dotfiles/.vimrc ~/.vimrc
vim +PluginInstall +qall

echo "Installing dot files ..."
rm -vf ~/.bash_aliases
rm -vf ~/.gitconfig
rm -vf ~/.tmux.conf
rm -vrf ~/.tmux-powerlinerc

ln -vs ~/.dotfiles/.bash_aliases ~/.bash_aliases
ln -vs ~/.dotfiles/.gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -vs ~/.dotfiles/.tmux.conf ~/.tmux.conf

install gnu commands
brew install coreutils

local PKGS PKG
PKGS=("findutils" "gnu-indent" "gnu-sed" "gnutls" "grep" "gnu-tar")
for PKG in "${PKGS[@]}"; do
    brew install $PKG --default-names
done

# install mac vim
# brew install -v macvim --override-system-vim
