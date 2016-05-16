__sed_here_plz__

if [ $IS_REMOTE = 1 ]; then
  source "$ADMIN_SCRIPTS/master.zshrc"
  source "$ADMIN_SCRIPTS/scm-prompt"
fi

ZSH=~/.oh-my-zsh
ZSH_THEME="gentoo"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"

plugins=(git z)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  [[ $BUFFER != sudo\ * ]] && BUFFER="sudo $BUFFER"
  zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

alias -s gz='tar xf'
alias -s bz2='tar xf'
alias -s tar='tar xf'
alias -s zip='unzip -x'
alias -s rar='unrar x'
alias -s 7z='7z x'
alias vi='vim'

if [ $IS_REMOTE = 1 ]; then
  setopt HIST_IGNORE_ALL_DUPS
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  alias hhhh='hphpd -h localhost'
  alias hhh2='hphpd -h localhost --debug-sandbox 2'
  alias hhh3='hphpd -h localhost --debug-sandbox 3'
fi
