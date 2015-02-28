#/usr/bin/env bash

cd `dirname $0`

cp zshrc ~/.zshrc
cp bashrc ~/.bashrc
cp gitconfig ~/.gitconfig
cp ycm_extra_conf.py ~/.ycm_extra_conf.py
cp tmux.conf ~/.tmux.conf
cp vimrc ~/.vimrc

rm -rf ~/.oh-my-zsh
git clone --depth=1 git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

rm -rf ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undodir
git clone --depth=1 git@github.com:gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

echo "done!"
