# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# color output
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

# aliases
alias vpn='protonvpn-cli'
alias dmesg='journalctl --dmesg -o short-monotonic --no-hostname --no-pager'
alias sudo='sudo '
alias dlna='minidlnad -f ~/.config/minidlna/minidlna.conf -P ~/.config/minidlna/minidlna.pid'
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias news='journalctl --since=today'
alias fullcharge='sudo tlp fullcharge BAT0 && sudo tlp fullcharge BAT1'

# help when command not found
source /usr/share/doc/pkgfile/command-not-found.bash

# git prompt
source /usr/share/git/completion/git-prompt.sh

prompt () {
    local BLACK="\[\033[0;30m\]"
    local DGRAY="\[\033[1;30m\]"
    local BLUE="\[\033[0;34m\]"
    local LBLUE="\[\033[1;34m\]"
    local GREEN="\[\033[0;32m\]"
    local LGREEN="\[\033[1;32m\]"
    local CYAN="\[\033[0;36m\]"
    local LCYAN="\[\033[1;36m\]"
    local RED="\[\033[0;31m\]"
    local LRED="\[\033[1;31m\]"
    local PURPLE="\[\033[0;35m\]"
    local LPURPLE="\[\033[1;35m\]"
    local BROWN="\[\033[0;33m\]"
    local YELLOW="\[\033[1;33m\]"
    local LGRAY="\[\033[0;37m\]"
    local WHITE="\[\033[1;37m\]"
    local NONE="\[\033[0m\]"

    local GIT=`(__git_ps1 "$NONE($LBLUE%s$NONE)")`

    PS1="$NONE[$LBLUE\A$NONE][$LBLUE\w$NONE]$NONE$GIT$WHITE\$ $NONE"
}

PROMPT_COMMAND=prompt

# sorry microsoft
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export ANDROID_HOME="$HOME/Workspace/Android/Sdk"

export EDITOR=vim

# the fuck? https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

# case insensitive tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# bash completion
source /usr/share/git/completion/git-completion.bash

# bash history
export HISTTIMEFORMAT="%h %d %H:%M:%S "
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="history*:[ \t]*"

export GIT_ASKPASS='/usr/bin/ksshaskpass'
export SSH_ASKPASS='/usr/bin/ksshaskpass'
export SSH_ASKPASS_REQUIRE=prefer
