alias nose='nosetests --rednose'
alias rc='rebar compile'
alias rd='rebar doc'
alias rt='rebar eunit skip_deps=true'
alias rtd='rebar eunit'
alias be='bundle exec'
alias ll='ls -al'

export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZE=1000
export GRAILS_HOME=~/dev/grails/grails-2.2.4
export GRADLE_HOME=~/dev/groovy/gradle-1.9
export PATH=~/bin:$GRADLE_HOME/bin:$GRAILS_HOME/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source `brew --repository`/Library/Contributions/brew_bash_completion.sh

