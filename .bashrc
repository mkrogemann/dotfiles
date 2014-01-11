alias nose='nosetests --rednose'
alias rc='rebar compile'
alias rd='rebar doc'
alias rt='rebar eunit'
alias be='bundle exec'
alias ll="ls -al"

export EDITOR=vim
export HISTSIZE=1000

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

export GRAILS_HOME=~/dev/grails/grails-2.2.4

export PATH=~/bin:$GRAILS_HOME/bin:$PATH

source `brew --repository`/Library/Contributions/brew_bash_completion.sh

