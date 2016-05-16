export IS_REMOTE=0

if [ $IS_REMOTE = 1 ]; then
  source "$ADMIN_SCRIPTS/master.bashrc"
fi

alias vi='vim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -a'
alias ll='ls -l'

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
