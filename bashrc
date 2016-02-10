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

#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#. "${GITAWAREPROMPT}/main.sh"

txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"
txtornge=$(tput setaf 166 2>/dev/null || echo "\e[1;33m")

alias ls='ls --color -F'
alias ll='ls -l'
alias l.='ls -d .*'
alias l='ls -l'
alias sl=ls
alias tial=tail
alias cx='chmod +x'
alias grep='grep -I --color'
alias igrep='grep -i'
alias rgrep='grep -rn'
alias egrep='egrep --color'
alias vi=vim
alias vimt='vim -t'
alias g++='g++ -std=c++14 -Werror -Wall -Wextra'
alias diff=colordiff

export TERM=xterm-256color

#export PS1="\[\e]0;[\h] \w\a\]\n\[\e[31m\]\u@\h \[\e[33m\]\w\[\033[0;32m\]\[\e[0m\]\$ "
#export PS1="\[$txtylw\][\!] \[$txtornge\]\u\[$txtrst\]@\[$txtylw\]\h:\[$txtgrn\]\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# this is the agility prompt
#export PS1="\[$txtornge\]\u\[$txtrst\]@\[$txtylw\]\h:\[$txtgrn\]\w\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

#export PATH=$HOME/bin:$PATH
export LD_LIBRARY_PATH=$HOME/lib
export LESS='-JFXRs'
export PAGER=less
export EDITOR=vim
export HISTFILESIZE=40000
export HISTSIZE=40000
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
export HISTCONTROL="ignoredups"
export PYTHONPATH=$HOME/lib/python3.4/site-packages
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
#eval `dircolors $HOME/dircolors-solarized/dircolors.256dark`

findctor() {
    egrep -Inr -- "(make_shared\s*<\s*|new\s+|make_unique\s*<\s*)[_a-zA-Z0-9:]*$1\s*(<.*)?>?\s*\(" $2
}
cgrep() {
    egrep -Irn --color --include "*.cpp" --include "*.h" --include="*.hpp" -- "$@" | egrep -v "(cpp|h|hpp):[[:digit:]]+:[[:space:]]*//" | egrep --color -- "$1"
}
gentags() {
    ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ "$1"
}
resolvedir() {
    cd `/bin/pwd`
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

# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +11 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 10; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}

alias cd=cd_func

# Automatically add completion for all aliases to commands having completion functions
function alias_completion {
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

GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    #alias gcc='colourify gcc'
    #alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias df='colourify df'
fi

# Base16 Shell (Konsole is broken, so not using)
#BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

. .shell_prompt.sh

if [[ $- =~ i ]] ; then
    doge
    date
    fortune
fi

