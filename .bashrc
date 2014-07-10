alias nose='nosetests --rednose'
alias rgd='_rebar get-deps'
alias rc='_rebar compile'
alias rd='_rebar doc'
alias rt='_rebar eunit skip_deps=true'
alias rtd='_rebar eunit'
alias be='bundle exec'
alias ll='ls -al'
alias java7='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home'
alias mongod='ulimit -n 2048 && mongod --config /usr/local/etc/mongod.conf' # 2.4.10 (brewed) likes this: 'mongod --dbpath /usr/local/var/mongodb'
alias postgres='postgres -D /usr/local/var/postgres'
alias rabbit='/usr/local/Cellar/rabbitmq/3.3.4/sbin/rabbitmq-server'

export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZE=1000
export GRAILS_HOME=~/dev/grails/grails-2.2.4
export GRADLE_HOME=~/dev/groovy/gradle-1.12
export PATH=~/bin:$GRADLE_HOME/bin:$GRAILS_HOME/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

# gcloud SDK
source '/Users/markus/bin/google-cloud-sdk/path.bash.inc'
source '/Users/markus/bin/google-cloud-sdk/completion.bash.inc'

_rebar() {
  [ -x ./rebar ] && ./rebar $@
  [ ! -x ./rebar ] && rebar $@
}
