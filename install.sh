#!/bin/bash

echo "Cloning autoenv project ..."
#/usr/bin/env git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv || exit 1

# remove old existing files
rm -vf ~/.gitconfig
rm -vf ~/.tmux.conf
rm -vf ~/.zshrc
rm -vrf ~/.tmux-powerlinerc
rm -vrf ~/.oh-my-zsh

# link to dotfiles
echo "Installing dot files ..."
ln -vs ~/.dotfiles/.gitconfig ~/.gitconfig
ln -vs ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -vs ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -vs ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -vs ~/.dotfiles/.zshrc ~/.zshrc
