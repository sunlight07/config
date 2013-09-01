#/usr/bin/env bash

cd `dirname $0`

rm -rf ~/.vim
cp -r vim ~/.vim
cp vimrc ~/.vimrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

echo "success!"

