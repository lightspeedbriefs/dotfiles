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
gnu_opts='-ggdb3 -fuse-ld=gold -D_GLIBCXX_ASSERTIONS -Wshadow=compatible-local'
clang_opts='-glldb -fuse-ld=lld -Wimplicit-fallthrough -D_LIBCPP_DEBUG=1'
link_flags='-Wl,--as-needed -Wl,--no-undefined -Wl,--warn-common'
gxx_opts='-Wsuggest-override -Wsuggest-final-types -Wsuggest-final-methods -Wnull-dereference'
cxx_opts="-std=c++17 -pipe -pthread -fvisibility=hidden -Og -gz -Wall -Wextra -Wdisabled-optimization $link_flags"
c_opts="-std=c17 -pipe -pthread -fvisibility=hidden -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Og -gz -Wall -Wextra -D_GNU_SOURCE $link_flags"
alias g++="g++ $cxx_opts $gxx_opts $gnu_opts"
alias gcc="gcc $c_opts $gnu_opts"
alias clang++="clang++ $cxx_opts $clang_opts"
alias clang="clang $c_opts $clang_opts"
unset cxx_opts c_opts gxx_opts gnu_opts clang_opts link_flags
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
        tcpdump traceroute traceroute6 ulimit uptime vmstat whois iwconfig)
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

[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

bindkey '^ ' autosuggest-execute

if [[ -f ~/.dir_colors && (( $+commands[dircolors] )) ]] ; then
    eval $(dircolors ~/.dir_colors)
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

if (( $+commands[powerline-go] )) ; then
    if [[ -f ~/.powerline-theme.json ]] ; then
        _powerline_themecmd=(-theme ~/.powerline-theme.json)
    fi

    function powerline_precmd() {
        PS1="$(powerline-go -error $? -shell zsh $_powerline_themecmd[@])"
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

    unfunction install_powerline_precmd
fi

if [[ -f ~/.zplug/init.zsh ]] ; then
    source ~/.zplug/init.zsh

    zplug "b4b4r07/enhancd", use:init.sh

    zplug "facebook/pathpicker", as:command, use:fpp

    zplug "supercrabtree/k"

    zplug "lib/termsupport", from:oh-my-zsh

    zplug "jhawthorn/fzy", \
        as:command, \
        hook-build:"make -j$(nproc)"

    zplug "zsh-users/zsh-autosuggestions"
    # Available in fedora repos but pretty out-of-date
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    # Seems to break things
    # zplug 'zplug/zplug', hook-build:'zplug --self-manage'

    zplug load --verbose
fi

(( $+commands[doge] )) && doge
(( $+commands[linux_logo] )) && linux_logo -u -a
(( $+commands[fortune] )) && fortune -s | cowsay
(( $+commands[date] )) && date
