# Command Aliases
alias psg='ps -ef|grep '

## Ruby aliases
alias cucumber='bundle exec cucumber --color'
alias guard='bundle exec guard'
alias rake='bundle exec rake'
alias rspec='bundle exec rspec --color'

## Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add -A'
alias gb='git blame -CCC'
alias gbr='git branch'
alias gc='git commit'
alias gcaa='git commit -a --amend -CHEAD'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gcl='git clean -fd'
alias gco='git checkout'

alias gl='git_pretty_log'
alias gld='git log -p'
alias gls='git shortlog -sn'
alias gst='git status -sb'
alias gmgr=gitMergeRuby
alias gmge=gitMergeElixir
alias gmgb=gitMergeBuilder
alias gmgy=gitMergeYarn
alias gmgnt=gitMergeNoTests
alias pr='hub pull-request'

gitMergeRuby() {
  git merge --no-ff $1 && rake && git push && git push origin :$1 && git branch -d $1
}

gitMergeElixir() {
  git merge --no-ff $1 && mix test && git push && git push origin :$1 && git branch -d $1
}

gitMergeBuilder() {
  git merge --no-ff $1 && builder run test && git push && git push origin :$1 && git branch -d $1
}

gitMergeYarn() {
  git merge --no-ff $1 && yarn jest && git push && git push origin :$1 && git branch -d $1
}

gitMergeNoTests() {
  git merge --no-ff $1 && git push && git push origin :$1 && git branch -d $1
}

## Dev aliases
alias prp='git pull && rake && git push'

## Proxy aliases
alias p='source $HOME/.bash-config/proxy on'
alias np='source $HOME/.bash-config/proxy off'

## Postgres aliases
alias pgd='source $HOME/.bash-config/postgres docker'
alias pgl='source $HOME/.bash-config/postgres local'
alias dbpg='export POSTGRES=1'
alias dbnpg='unset POSTGRES'

## AWS Aliases
alias rds-instances=rdsInstances
alias rds-log-files=rdsDescribeLogFiles
alias rds-get-logfile=rdsGetLogFile

rdsInstances() {
  aws rds describe-db-instances
}

rdsDescribeLogFiles() {
  aws rds describe-db-log-files --db-instance-identifier $1
}

rdsGetLogFile() {
  aws rds download-db-log-file-portion --db-instance-identifier $1 --log-file-name $2 > $CODEROOT/nextdayproperty/$2
}