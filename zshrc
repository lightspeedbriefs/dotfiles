if (( $+commands[exa] )) ; then
    alias exa='exa -F'
    alias ls='exa -F'
    alias ll='exa -lh --git'
else
    alias ls='ls --color -F'
    if (( $+commands[grc] )) ; then
        alias ll='grc -es --colour=auto ls -lhF --color'
    else
        alias ll='ls -lh'
    fi
fi
alias cx='chmod +x'
alias egrep='egrep --color'
if (( $+commands[nvim] )) ; then
    alias vi=nvim
else
    alias vi=vim
fi
gpp_opts='-ggdb3 -Wsuggest-override -Wsuggest-final-types -Wsuggest-final-methods'
cxx_opts='-std=c++17 -pthread -Og -Wall -Wextra -Wdisabled-optimization'
c_opts='-std=c11 -pthread -Og -Wall -Wextra'
alias g++="g++ $cxx_opts $gpp_opts"
alias gcc="gcc $c_opts -ggdb3"
alias clang++="clang++ $cxx_opts -glldb"
alias clang="clang $c_opts -glldb"
unset cxx_opts c_opts gpp_opts
if (( $+commands[rg] )) ; then
    alias rf='rg --files -g'
    alias findf='rg --files -g'
    alias cgrep='rg -tcpp'
elif (( $+commands[ag] )) ; then
    alias rf='ag -g ""'
    alias findf='ag -g ""'
    alias cgrep='ag --cpp'
else
    alias findf='find . -type f -name'
fi
alias findd='find . -type d -name'
if (( $+commands[colordiff] )) ; then
    alias diff=colordiff
elif (( $+commands[grc] )) ; then
    alias diff='grc -es --colour=auto diff'
fi
if (( $+commands[rougify] )) ; then
    alias ccat='rougify -t base16.monokai'
elif (( $+commands[pygmentize] )) ; then
    alias ccat='pygmentize -g'
fi
alias dmesg='dmesg -H'
alias cgrep='rg --type cpp'
alias gentags='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
if (( $+commands[grc] )) ; then
    alias colourify='grc -es --colour=auto'
    alias df='grc -es --colour=auto df -h'
    alias free='grc -es --colour=auto free -h'
    alias gmake='grc -es --colour=auto gmake -j$(nproc)'
    alias make='grc -es --colour=auto make -j$(nproc)'
    cmds=(ant as blkid configure cvs dig docker docker-machine du env fdisk findmnt gas getfacl getsebool \
        gold id ifconfig ip iptables lsattr lsblk lsmod lsof lspci mount mtr netstat nmap ping ps semanage \
        tcpdump traceroute traceroute6 ulimit uptime vmstat)
    # Already has color: diff, gcc, g++, systemctl
    # Interactive: dnf
    for cmd in $cmds ; do
        if (( $+commands[$cmd] )) ; then
          alias $cmd="grc -es --colour=auto $cmd"
        fi
    done
    unset cmds cmd
else
    if (( $+commands[colormake] )) ; then
        alias gmake='colormake -j$(nproc)'
        alias make='colormake -j$(nproc)'
    else
        alias gmake='gmake -j$(nproc)'
        alias make='make -j$(nproc)'
    fi
fi
alias -s git='git clone'
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=aunpack

autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

autoload -U compinit && compinit

setopt   combining_chars
setopt   complete_aliases
setopt   complete_in_word
setopt   correct
setopt   extended_history
unsetopt flow_control
setopt   inc_append_history
setopt   interactive_comments
setopt   hist_expire_dups_first
setopt   hist_find_no_dups
setopt   hist_ignore_dups
setopt   hist_ignore_space
setopt   hist_no_store
setopt   hist_reduce_blanks
setopt   long_list_jobs
setopt   numeric_glob_sort
setopt   prompt_subst
bindkey -e

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

if [[ "${terminfo[khome]}" != "" ]]; then
    bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
    bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space # [Space] - do history expansion

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey "${terminfo[kdch1]}" delete-char # [Delete] - delete forward

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

#bindkey -s "\C-r" "\eqhh\n"     # bind hh to Ctrl-r (for Vi mode check doc)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -f ~/.zplug/init.zsh ]] ; then
    source ~/.zplug/init.zsh

    zplug "b4b4r07/enhancd", use:init.sh

    zplug "BurntSushi/ripgrep", use:complete

    zplug "facebook/pathpicker", as:command, use:fpp

    zplug "supercrabtree/k"

    zplug "justjanne/powerline-go", from:gh-r, as:command, rename-to:powerline-go

    zplug "lib/termsupport", from:oh-my-zsh

    if (( $+commands[powerline-go] )) ; then
        function powerline_precmd() {
            PS1="$(powerline-go -error $? -shell zsh)"
        }

        function install_powerline_precmd() {
          for s in "${precmd_functions[@]}"; do
            if [ "$s" = "powerline_precmd" ]; then
              return
            fi
          done
          precmd_functions+=(powerline_precmd)
        }

        if [ "$TERM" != "linux" ]; then
            install_powerline_precmd
        fi
    fi

    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    zplug load --verbose
fi

(( $+commands[doge] )) && doge
(( $+commands[linux_logo] )) && linux_logo -u -a
(( $+commands[fortune] )) && fortune -s | cowsay
(( $+commands[date] )) && date
