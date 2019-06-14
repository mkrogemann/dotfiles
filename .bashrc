alias ll='ls -al'
alias mts='mix test --stale'
alias mongod='ulimit -n 2048 && mongod --config /usr/local/etc/mongod.conf' # 2.4.10 (brewed) likes this: 'mongod --dbpath /usr/local/var/mongodb'
alias postgres='postgres -D /usr/local/var/postgres'
alias http_server='_http_server'
alias tcpd='_tcpd'
alias rstudio='_rstudio'
alias redis='redis-server /usr/local/etc/redis.conf'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export HISTSIZE=2000
export HISTFILESIZE=2000
export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export ERL_AFLAGS="-kernel shell_history enabled"
export MACTEX_PATH="/usr/local/texlive/2019/bin/x86_64-darwin"
export PATH=~/bin:/usr/local/bin:/usr/local/opt/gpg-agent/bin:$PATH:$MACTEX_PATH

if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Default
  source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

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

# SDKMAN - type sdk current to get an overview of what is installed
export SDKMAN_DIR="/Users/markus/.sdkman"
[[ -s "/Users/markus/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/markus/.sdkman/bin/sdkman-init.sh"

# http://stackoverflow.com/questions/14177700/copy-current-command-at-bash-prompt-to-clipboard
bind '"\C-]":"\C-e\C-u pbcopy <<"EOF"\n\C-y\nEOF\n"'

_http_server() {
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
