#/usr/bin/env bash

cd `dirname $0`

rm -rf ~/.oh-my-zsh
cp -r oh-my-zsh ~/.oh-my-zsh

cp zshrc ~/.zshrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig

rm -rf ~/.vim
mkdir -p ~/.vim/bundle
cp -r ./vundle ~/.vim/bundle/
cp ./ycm_extra_conf.py ~/.ycm_extra_conf.py

cp vimrc ~/.vimrc
vim +BundleInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd -

mkdir -p ~/.vim/undodir

echo "done!"

