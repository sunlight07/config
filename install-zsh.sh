#/usr/bin/env zsh

cd `dirname $0`

rm -rf ~/.vim
cp -r vim ~/.vim
cp vimrc ~/.vimrc
cp zshrc ~/.zshrc
rm -rf ~/.oh-my-zsh
cp -r oh-my-zsh ~/.oh-my-zsh
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

echo "success!"

