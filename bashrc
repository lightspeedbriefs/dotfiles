# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias ls='ls --color -F'
alias ll='ls -h --full-time'
alias l.='ls -d .*'
alias l='exa -lgh'
alias sl=ls
alias tial=tail
alias cx='chmod +x'
alias grep='grep -I --color'
alias igrep='grep -i'
alias rgrep='grep -rn'
alias egrep='egrep --color'
alias vi=nvim
alias vimt='nvim -t'
alias g++='g++ -std=c++14 -Werror -Wall -Wextra'
alias diff=colordiff
alias dmesg='dmesg -H'
alias agc='ag --cc'
alias agx='ag --cpp'
alias cgrep='rg --type cpp'
alias resolvedir='cd $(/bin/pwd)'
alias gentags='ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
VIM_EXE=$(which nvim 2>/dev/null)
if [[ ! -x "$VIM_EXE" ]] ; then
    VIM_EXE=$(which vim)
fi
export VIM_EXE
fvim() {
    if [[ $# -ge 1 ]] ; then
        local fpat="-g $1"
    fi
    'rg' --maxdepth 1 -l $fpat -e . | 'fpp'
}
vim() {
    for arg in "$@" ; do
        if [[ -s "$arg" ]] ; then
            # Check if we're trying to edit a binary file
            if ! 'rg' -q -e . -- "$arg" ; then
                fvim "$arg*"
            fi
        fi
    done
    "$VIM_EXE" "$@"
}
findf() {
    local loc=.
    if [[ $# -ge 2 ]] ; then
        loc=$1; shift
    fi
    'find' "$loc" -type f -name "$@"
}
findd() {
    local loc=.
    if [[ $# -ge 2 ]] ; then
        loc=$1; shift
    fi
    'find' "$loc" -type d -name "$@"
}
finde() {
    local loc=.
    if [[ $# -ge 2 ]] ; then
        loc=$1; shift
    fi
    'find' "$loc" -type f -executable -name "$@"
}

export TERM=xterm-256color

export LD_LIBRARY_PATH=$HOME/lib
export PATH=/usr/lib/colorgcc/bin:$HOME/.cargo/bin:$PATH
export PYTHONPATH=/usr/lib64/python2.7/site-packages/lldb
export CCACHE_PATH=/usr/bin
export LESS='-JFXRs'
export PAGER=less
export EDITOR=vim
export HISTFILESIZE=40000
export HISTSIZE=40000
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
export HISTCONTROL="ignoredups"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export AUTOJUMP_AUTOCOMPLETE_CMDS='cp vim'
export ENHANCD_FILTER=fzf:fzy:percol:pick:selecta:fpp
export ENHANCD_DISABLE_HYPHEN=1
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
if [[ -n "$DISPLAY" ]] ; then
    export BROWSER=firefox
fi

# Less Colors for Man Pages
#export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
#export LESS_TERMCAP_md=$'\E[01;38;5;74m' # begin bold
#export LESS_TERMCAP_me=$'\E[0m' # end mode
#export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m' # begin standout-mode - info box
#export LESS_TERMCAP_ue=$'\E[0m' # end underline
#export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
#export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline
export GROFF_NO_SGR=yes
export MAN_POSIXLY_CORRECT=1
#export JAVA_HOME=/usr/java/latest

findctor() {
    rg --type cpp "(make_shared\s*<\s*|new\s+(\(\s*&?\s*[a-zA-Z_][a-zA-Z0-9_]*\s*\)\s+)?|make_unique\s*<\s*)[_a-zA-Z0-9:]*$1\s*(<.*)?>?\s*\(" $2
}
viml() {
    if [[ $# -ne 2 ]] ; then
        echo "Wrong number of arguments - need line number and filename" >&2
        return
    fi
    vim +$1 "$2"
}
vimfind() {
    #echo "ARGS: $@"
    re='^[0-9]+$'
    unset line
    if [[ $# -gt 2 && $3 =~ $re ]] ; then
        line=("+$3" '+set cursorline cursorcolumn')
    fi
    #echo "Using line: ${line[@]}"
    allhits=$(find src -regextype posix-extended -type f -regex ".*/$1.*\.$2p{0,2}$")
    exact=$(echo "$allhits" | egrep "/$1\.$2p{0,2}$")
    if [[ -n "$exact" && -f "$exact" ]] ; then
        files=$exact
    else
        files=$allhits
    fi
    if [[ -z "$files" ]] ; then
        echo "Could not find files matching \"$1\" in src" >&2
        return 1
    fi
    vim "${line[@]}" $files
}
vimh() {
    vimfind "$1" h "$2"
}
vimc() {
    vimfind "$1" c "$2"
}

GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"
    alias blkid='colourify blkid'
    alias configure='colourify ./configure'
    alias df='colourify df'
    alias diff='colourify diff'
    alias docker='colourify docker'
    alias docker-machine='colourify docker-machine'
    alias du='colourify du'
    alias env='colourify env'
    alias free='colourify free'
    alias fdisk='colourify fdisk'
    alias findmnt='colourify findmnt'
    alias make='colourify make'
    #alias gcc='colourify gcc'
    #alias g++='colourify g++'
    alias id='colourify id'
    alias ip='colourify ip'
    alias iptables='colourify iptables'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    #alias ls='colourify ls'
    alias lsof='colourify lsof'
    alias lsblk='colourify lsblk'
    alias lspci='colourify lspci'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify traceroute'
    alias traceroute6='colourify traceroute6'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias semanage='colourify semanage'
    alias getsebool='colourify setsebool'
    alias ifconfig='colourify ifconfig'
fi

# Automatically add completion for all aliases to commands having completion functions
function alias_completion {
    local COMP_CWORD=1
    local namespace="alias_completion"

    # parse function based completion definitions, where capture group 2 => function and 3 => trigger
    local compl_regex='complete( +[^ ]+)* -F ([^ ]+) ("[^"]+"|[^ ]+)'
    # parse alias definitions, where capture group 1 => trigger, 2 => command, 3 => command arguments
    local alias_regex="alias ([^=]+)='(\"[^\"]+\"|[^ ]+)(( +[^ ]+)*)'"

    # create array of function completion triggers, keeping multi-word triggers together
    eval "local completions=($(complete -p | sed -Ene "/$compl_regex/s//'\3'/p"))"
    (( ${#completions[@]} == 0 )) && return 0

    # create temporary file for wrapper functions and completions
    rm -f "/tmp/${namespace}-*.tmp" # preliminary cleanup
    local tmp_file; tmp_file="$(mktemp "/tmp/${namespace}-${RANDOM}XXX.tmp")" || return 1

    local completion_loader; completion_loader="$(complete -p -D 2>/dev/null | sed -Ene 's/.* -F ([^ ]*).*/\1/p')"

    # read in "<alias> '<aliased command>' '<command args>'" lines from defined aliases
    local line; while read line; do
        eval "local alias_tokens; alias_tokens=($line)" 2>/dev/null || continue # some alias arg patterns cause an eval parse error
        local alias_name="${alias_tokens[0]}" alias_cmd="${alias_tokens[1]}" alias_args="${alias_tokens[2]# }"

        # skip aliases to pipes, boolean control structures and other command lists
        # (leveraging that eval errs out if $alias_args contains unquoted shell metacharacters)
        eval "local alias_arg_words; alias_arg_words=($alias_args)" 2>/dev/null || continue
        # avoid expanding wildcards
        read -a alias_arg_words <<< "$alias_args"

        # skip alias if there is no completion function triggered by the aliased command
        if [[ ! " ${completions[*]} " =~ " $alias_cmd " ]]; then
            if [[ -n "$completion_loader" ]]; then
                # force loading of completions for the aliased command
                eval "$completion_loader $alias_cmd"
                # 124 means completion loader was successful
                [[ $? -eq 124 ]] || continue
                completions+=($alias_cmd)
            else
                continue
            fi
        fi
        local new_completion="$(complete -p "$alias_cmd")"

        # create a wrapper inserting the alias arguments if any
        if [[ -n $alias_args ]]; then
            local compl_func="${new_completion/#* -F /}"; compl_func="${compl_func%% *}"
            # avoid recursive call loops by ignoring our own functions
            if [[ "${compl_func#_$namespace::}" == $compl_func ]]; then
                local compl_wrapper="_${namespace}::${alias_name}"
                    echo "function $compl_wrapper {
                        (( COMP_CWORD += ${#alias_arg_words[@]} ))
                        COMP_WORDS=($alias_cmd $alias_args \${COMP_WORDS[@]:1})
                        (( COMP_POINT -= \${#COMP_LINE} ))
                        COMP_LINE=\${COMP_LINE/$alias_name/$alias_cmd $alias_args}
                        (( COMP_POINT += \${#COMP_LINE} ))
                        $compl_func
                    }" >> "$tmp_file"
                    new_completion="${new_completion/ -F $compl_func / -F $compl_wrapper }"
            fi
        fi

        # replace completion trigger by alias
        new_completion="${new_completion% *} $alias_name"
        echo "$new_completion" >> "$tmp_file"
    done < <(alias -p | sed -Ene "s/$alias_regex/\1 '\2' '\3'/p")
    source "$tmp_file" && rm -f "$tmp_file"
}; alias_completion

export HH_CONFIG=hicolor
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-n": "\C-a hh \C-j"'; fi

# Base16 Shell (Konsole is broken, so not using)
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

[[ -s ~/.shell_prompt2.sh ]] && . .shell_prompt2.sh
[[ -s ~/.fzf.bash ]] && source ~/.fzf.bash
[[ -s ~/enhancd/init.sh ]] && . ~/enhancd/init.sh
nixsh=~/.nix-profile/etc/profile.d/nix.sh
[[ -s $nixsh ]] && . $nixsh

if [[ $- =~ i && -z "$ALREADY_SOURCED_BASHRC" ]] ; then
    doge
    linux_logo -u -a
    fortune -s | cowsay
    date
fi

export ALREADY_SOURCED_BASHRC=1
