#/usr/bin/env bash

cd `dirname $0`

rm -rf ~/.vim
rm -rf ~/.oh-my-zsh
cp -r vim ~/.vim
cp -r oh-my-zsh ~/.oh-my-zsh

cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

echo "success!"

