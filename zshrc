ZSH=~/.oh-my-zsh
ZSH_THEME="gentoo"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

plugins=(git django zsh-syntax-highlighting make z)

source $ZSH/oh-my-zsh.sh

# User configuration
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

alias make='make -j4'
alias makec='make clean && make'

alias nl='nl -s " " -w 1'

alias -s gz='tar xf'
alias -s bz2='tar xf'
alias -s tar='tar xf'
alias -s zip='unzip -x'
alias -s rar='unrar x'
alias -s 7z='7z x'

sudo-command-line() {
	[[ -z $BUFFER ]] && zle up-history
	[[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
	zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="/usr/texbin:$HOME/db_oj/script:$PATH"
export PYTHONPATH="$HOME/db_oj/common/lib:$HOME/db_oj/frontend:$PYTHONPATH"

alias updatedb='/usr/libexec/locate.updatedb'
alias mm='mosh 166.111.71.207 -- tmux'
alias mz='mosh 166.111.71.172 -- tmux'
alias gcc='gcc-4.9'
alias g++='g++-4.9'
alias ag='ag -U'
