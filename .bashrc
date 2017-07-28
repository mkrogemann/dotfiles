alias rgd='_rebar get-deps'
alias rc='_rebar compile'
alias rd='_rebar doc'
alias rt='_rebar eunit skip_deps=true'
alias rtd='_rebar eunit'
alias ll='ls -al'
alias mts='mix test --stale'
alias java7='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home'
alias mongod='ulimit -n 2048 && mongod --config /usr/local/etc/mongod.conf' # 2.4.10 (brewed) likes this: 'mongod --dbpath /usr/local/var/mongodb'
alias postgres='postgres -D /usr/local/var/postgres'
alias http='_http'
alias tcpd='_tcpd'
alias scala='scala -Dscala.color'
alias rstudio='_rstudio'
alias redis='redis-server /usr/local/etc/redis.conf'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
export GOPATH=$HOME/dev/qixxit/gocode
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH=~/bin:/usr/local/bin:/usr/local/opt/gpg-agent/bin:$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

[[ -s "$HOME/.dev-envs" ]] && source "$HOME/.dev-envs"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

source /usr/local/opt/autoenv/activate.sh

[ -f /Users/markus/.travis/travis.sh ] && source /Users/markus/.travis/travis.sh

GPG_TTY=$(tty)
export GPG_TTY

if [ -f "${HOME}/.gpg-agent-info" ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
 fi

# http://stackoverflow.com/questions/14177700/copy-current-command-at-bash-prompt-to-clipboard
bind '"\C-]":"\C-e\C-u pbcopy <<"EOF"\n\C-y\nEOF\n"'

_rebar() {
  [ -x ./rebar ] && ./rebar $@
  [ ! -x ./rebar ] && rebar $@
}

_http() {
  if [ $# -eq 0 ] ; then
    echo "Please provide port (eg http 9000)"
  else
    python -m SimpleHTTPServer $1
  fi
}

_tcpd() {
  if [ $# -eq 0 ] ; then
    echo "Please provide port (eg tcpd 9000)"
  else
    sudo tcpdump -s 0 -A -i lo0 "tcp port $1 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)"
    # print only IPv4 packets that contain data, not, for example, SYN and FIN packets and ACK-only packets
  fi
}

rtmp_open() {
  rtmpdump -r $1 --quiet | /Applications/VLC.app/Contents/MacOS/VLC fd://0 --playlist-autostart
}

_rstudio() {
  /Applications/RStudio.app/Contents/MacOS/RStudio $@ &
}
