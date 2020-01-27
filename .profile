source ~/personal/scripts/z/z.sh

# aliases
alias vim="nvim"
alias m="make"
alias mt="make test"
alias new_session="sh ~/Personal/scripts/new_session.sh"
alias lsof_listen="sudo lsof -PiTCP -sTCP:LISTEN"
alias v='vim'
alias vr='vim -R'
alias c='cat'
alias f='find .'
alias ff='find . -type f'
alias ffp='find . -type f -name "*.py"'
alias ffpp='find . -type f -name "*.py" | grep -v env'
alias ffppt='find . -type f -name "*.py" | grep -v test | grep -v env'
alias ffg='find . -type f -name "*.go"'
alias ffgg='find . -type f -name "*.go" | grep -v .gen | grep -v vendor'
alias ffggt='find . -type f -name "*.go" | grep -v test | grep -v .gen | grep -v vendor'
alias ffj='find . -type f -name "*.js"'
alias ffjj='find . -type f -name "*.js" | grep -v node_modules'
alias ffjjt='find . -type f -name "*.js" | grep -v node_modules | grep -v test'
alias fxg='find . | xargs grep --color=always -s'
alias m='make'
alias mt='make test'
alias l='ls -ltr'
alias la='ls -ltra'
alias h='hostname'
alias p='pwd'
alias x='xargs'
alias xg='xargs grep --color=always -s'

# golang
export GOPATH=$HOME/Work/go
export PATH="$PATH:$GOPATH/bin"

# git
source ~/personal/scripts/git-completion.bash
alias glg='git log --oneline --graph --abbrev-commit --decorate --color'
alias glgb='git log --oneline --graph --abbrev-commit --decorate --color --branches=*'
alias gsl='git shortlog -s -n --all --no-merges'
# clean up git pager's output 
export LESS=R

# Unlimited history 
HISTSIZE= HISTFILESIZE=
# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups  
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a" #; history -c; history -r"
# apply timestamp everytime
export HISTTIMEFORMAT="%d/%m/%y %T "

# autossh
export AUTOSSH_PORT=0
export AUTOSSH_POLL=1

#homebrew
export PATH="/usr/local/sbin:$PATH"

# silence Catalina zsh declaration
export BASH_SILENCE_DEPRECATION_WARNING=1
