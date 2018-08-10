function is_production () {
    local ENVFILE="/etc/uber/environment"
    [ -f "$ENVFILE" ] && [ $(cat "$ENVFILE") = "production" ]
}

#tmux doesn't pick up new ssh-agent env vars
fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

# pipe compatible overrides
function g() { $(which grep) --color=always -s "$@"; }

# aliases
alias vim="nvim"
alias m="make"
alias mt="make test"
alias new_session="sh ~/work/scripts/new_session.sh"
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
alias l='ls -ltra'
alias h='hostname'
alias p='pwd'
alias x='xargs'
alias xg='xargs grep --color=always -s'

# oncall
function rtapi() { find ~/uber/realtime-api/endpoints -type f | egrep "spec.json" | grep -v test | xargs grep -l $1 | xargs cat | jq "{endpoint: .\"$1\"}"; }
alias rtapi_all='find /Users/henryhsue/uber/realtime-api/endpoints -type f | egrep "index.js|spec.json" | grep -v test'

# ldap
export UBER_LDAP_UID="hhenry"

# golang
export GOPATH=$HOME/work/repos/gocode
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH="$PATH:$GOPATH/bin"

# git
source ~/work/scripts/git-completion.bash
alias glg='git log --oneline --graph --abbrev-commit --decorate --color'
alias glgb='git log --oneline --graph --abbrev-commit --decorate --color --branches=*'
alias gsl='git shortlog -s -n --all --no-merges'
# clean up git pager's output 
export LESS=R

# clusto
#export PYTHONPATH+=~/Uber/clustoclient

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


if is_production; then
    alias ci="clusto info"
    alias cas="clusto attr show"
    alias cps="clusto pool show"
    alias lo="loony"
    alias gg="git log --graph --abbrev-commit --decorate --date=relative --all"
else
    # added by newengsetup
    export EDITOR=vim
    export UBER_HOME="$HOME/Uber"
    export UBER_OWNER="hhenry@uber.com"
    export VAGRANT_DEFAULT_PROVIDER=aws
    export PATH="$HOME/bin:$PATH"
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

    #boxer
    cdsync () {
        cd $(boxer sync_dir $@)
    }
    editsync () {
        $EDITOR $(boxer sync_dir $@)
    }
    opensync () {
        open $(boxer sync_dir $@)
    }

    #productivity
    source ~/work/scripts/z/z.sh
fi

# custom prompt
#if is_production; then
#  PROMPT_COLOR="\[\033[1;35m\]"
#else
#  PROMPT_COLOR="\[\033[1;32m\]"
#fi
#too long!
#PS1="${PROMPT_COLOR}\u@\h \[\033[1;34m\]\w"'$(__git_ps1 " \[\e[1;33m\](%s)\[\e[0;39m\] ")'"\[\033[1;35m\]\$\[\033[0m\] "
#shorter:
#PS1="${PROMPT_COLOR}"'./${PWD#"${PWD%/*}/"}''$(__git_ps1 "\[\e[1;33m\](%s)\[\e[0;39m\]")'"\[\033[1;35m\]\$\[\033[0m\] "
#export PS1="\e[0;32m\h:\W \u \$\e[m "
export PS1="\$ "

#recycle
#export PATH="$( pwd )/vendor/bin:${PATH}"


# portal-web
#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

#homebrew
export PATH="/usr/local/sbin:$PATH"

#ldap
export UBER_LDAP_UID=hhenry
