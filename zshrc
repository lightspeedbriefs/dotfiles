if (( $+commands[exa] )) ; then
    alias exa='exa -F'
    alias xl='exa -lh --git'
    alias lx='exa -lh --git'
fi
if (( $+commands[lsd] )) ; then
    alias tree='lsd --total-size --tree --blocks size,name'
else
    alias tree='tree -h --du'
fi
alias ls='ls --color -F'
if (( $+commands[grc] )) ; then
    alias ll='grc -es --colour=auto ls -lhF --color'
else
    alias ll='ls -lh'
fi
alias cx='chmod +x'
alias egrep='egrep --color'
if (( $+commands[nvim] )) ; then
    alias vi=nvim
    alias view='nvim -R'
else
    alias vi=vim
fi
alias ydiff='ydiff -s -w0'
gnu_opts='-ggdb3 -fuse-ld=lld -D_GLIBCXX_ASSERTIONS -Wshadow=compatible-local'
clang_opts='-glldb -fuse-ld=lld -Wimplicit-fallthrough -D_LIBCPP_DEBUG=1'
link_flags='-Wl,--as-needed -Wl,--no-undefined -Wl,--warn-common'
gxx_opts='-Wsuggest-override -Wsuggest-final-types -Wsuggest-final-methods -Wnull-dereference'
cxx_opts="-std=c++17 -pipe -pthread -fvisibility=hidden -Og -gz -Wall -Wextra -Wdisabled-optimization -Wconversion -Wsign-conversion $link_flags"
c_opts="-std=c17 -pipe -pthread -fvisibility=hidden -fno-exceptions -fno-unwind-tables -fno-asynchronous-unwind-tables -Og -gz -Wall -Wextra -D_GNU_SOURCE $link_flags"
alias g++="g++ -Wlogical-op $cxx_opts $gxx_opts $gnu_opts"
alias gcc="gcc $c_opts $gnu_opts"
alias clang++="clang++ -Woverloaded-virtual -Wnon-virtual-dtor $cxx_opts $clang_opts"
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
elif (( $+commands[fd] )) ; then
    alias findf='fd -t f'
else
    alias findf='find . -type f -name'
fi
if (( $+commands[fd] )) ; then
    alias findd='fd -t d'
else
    alias findd='find . -type d -name'
fi
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
if (( $+commands[podman] )) ; then
    alias docker=podman
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
    # Note: on Fedora you can source /etc/grc.zsh to have this done for a pre-set list of
    # commands, but it is not as comprehensive as what is shown here.
    cmds=(ant as blkid configure cvs dig docker docker-machine du env fdisk findmnt gas getfacl getsebool \
        gold id ifconfig ip iptables lsattr lsblk lsmod lsof lspci mount mtr netstat nmap ping ping6 ps semanage \
        tcpdump traceroute traceroute6 ulimit uptime vmstat whois iwconfig)
    # Already has color: diff, dnf, gcc, g++, systemctl
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
alias ncdu="ncdu --color=dark"
alias pping=prettyping
alias -s git='git clone'
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz,zst}=aunpack

autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

autoload -U compinit && compinit

setopt   combining_chars
setopt   complete_aliases
setopt   complete_in_word
setopt   correct
setopt   correctall
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
setopt   listpacked
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

# bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

bindkey '^ ' autosuggest-execute

if [[ -d ~/.zfunc ]] ; then
    fpath+=~/.zfunc
fi

if [[ -f ~/.dir_colors && (( $+commands[dircolors] )) ]] ; then
    eval $(dircolors ~/.dir_colors)
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# TODO: figure out more to take from:
# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh
# https://github.com/mattjj/my-oh-my-zsh/blob/master/completion.zsh
# https://gist.github.com/flixr/1468156/4b2100203ace61d8affce6846cf45b889cb2d67b

# ignores filenames already in the line
zstyle ':completion:*:(rm|cp|mv|kill|diff|icdiff|cdiff|colordiff):*' ignore-line yes

zstyle ':completion:*:*:*:users' ignored-patterns \
    '_*' abrt adm akmods amanda apache at avahi avahi-autoipd backup beaglidx \
    bin bind cacti canna chrony cl-builder clamav colord couchdb daemon dbus \
    dictd distcache dnsmasq dockerroot dovecot earlyoom fax festival firebird \
    flatpak ftp games gdm geoclue gkrellmd gluster gnats gopher hacluster \
    haldaemon halt hplip hsqldb ident identd irc jetty junkbust kdm kernoops \
    ldap libuuid lightdm list lp lxd mail mailman mailnull man messagebus \
    mldonkey mysql nagios named netdump news nfsnobody nm-openconnect \
    nm-openvpn nobody nscd ntp nut nx obsrun openvpn operator pcap pipewire \
    polkitd postfix postgres privoxy proxy pulse pvm qemu quagga radvd root \
    rpc rpcuser rpm rtkit saned saslauth scard sddm setroubleshoot shutdown \
    speech-dispatcher squid sshd statd stubby stunnel4 svn sync sys syslog \
    systemd-bus-proxy systemd-coredump systemd-network systemd-resolve \
    systemd-timesync tcpdump tftp tomcat tss unbound usbmux uucp vcsa \
    vde2-net www-data wwwrun xfs

local extract="
# trim input(what you select)
local in=\${\${\"\$(<{f})\"%\$'\0'*}#*\$'\0'}
# get ctxt for current completion(some thing before or after the current word)
local -A ctxt=(\"\${(@ps:\2:)CTXT}\")
# real path
local realpath=\${ctxt[IPREFIX]}\${ctxt[hpre]}\$in
realpath=\${(Qe)~realpath}
"

# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap

# give a preview of directory by exa when completing cd
if (( $+commands[lsd] )) ; then
    zstyle ':fzf-tab:complete:cd:*' extra-opts --preview=$extract'lsd --icon=always --color=always $realpath'
fi

# Both silver and powerline-go are in the Fedora repos
# silver is prefereable when using vscode because you can specify
# 24-bit hex color codes for each segment, but otherwise powerline-go
# offers greater functionality.
if (( $+commands[silver] )) && [[ "$TERM_PROGRAM" == vscode || (( $+commands[powerline-go] == 0 )) ]] ; then
    SILVER=(virtualenv:b48ead:2e3440 user:434c5e:d8dee9 dir:81a1c1:2e3440 git:a3be8c:2e3440:ebcb8b status:bf616a:d8dee9)
    export SILVER_SHELL=zsh
    eval "$(silver init)"
elif (( $+commands[powerline-go] )) ; then
    if [[ -f ~/.powerline-theme.json ]] ; then
        _powerline_themecmd=(-theme ~/.powerline-theme.json)
    fi

    function powerline_precmd() {
        # PS1="$(powerline-go -error $? -shell zsh -path-aliases "~=" $_powerline_themecmd[@])"
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

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'lsd --icon=always --color=always {}' ;;
    *)            fzf "$@" ;;
  esac
}

# Unfortunately, skim lacks a maintainer for Fedora
# so upstream is no longer shipping it:
# https://bugzilla.redhat.com/show_bug.cgi?id=1823686

# Unfortunately, upstream Fedora ships the fzf
# package with "completion.zsh" erroneously installed
# as /usr/share/zsh/site-functions/fzf rather than
# /usr/share/fzf/shell/completion.zsh
# See: https://bugzilla.redhat.com/show_bug.cgi?id=1513913
[ -f /usr/share/fzf/shell/completion.zsh ] && source /usr/share/fzf/shell/completion.zsh
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

if [[ -f ~/.zplug/init.zsh ]] ; then
    source ~/.zplug/init.zsh

    zplug "b4b4r07/enhancd", use:init.sh

    zplug "facebook/pathpicker", as:command, use:fpp

    zplug "supercrabtree/k"

    zplug "lib/termsupport", from:oh-my-zsh

    zplug "jhawthorn/fzy", \
        as:command, \
        hook-build:"make -j$(nproc)"

    zplug "zsh-users/zsh-autosuggestions", at:develop

    # Available in fedora repos but pretty out-of-date
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    if (( $+commands[fzf] )) ; then
        zplug 'wfxr/forgit'
        zplug 'Aloxaf/fzf-tab'
        # zplug 'lincheney/fzf-tab-completion', use:zsh/fzf-zsh-completion.sh
    fi

    # Seems to break things
    # zplug 'zplug/zplug', hook-build:'zplug --self-manage'

    zplug load # --verbose
fi

zstyle ':completion:*' fzf-search-display true

(( $+commands[doge] )) && doge
(( $+commands[linux_logo] )) && linux_logo -u -a
(( $+commands[fortune] )) && fortune -s | cowsay
(( $+commands[date] )) && date
