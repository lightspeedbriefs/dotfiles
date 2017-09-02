if [[ -d ~/.cargo/bin ]] ; then
    export PATH=~/.cargo/bin:$PATH
fi
export PYTHONPATH=/usr/lib64/python2.7/site-packages/lldb
export CCACHE_PATH=/usr/bin
export LESS='-JFXRs'
export PAGER=less
if (( $+commands[nvim] )) ; then
    export EDITOR=nvim
elif (( $+commands[vim] )) ; then
    export EDITOR=vim
fi
export HISTFILE=~/.zsh_history
export HISTFILESIZE=40000
export HISTSIZE=40000
export SAVEHIST=40000
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S] "
export HISTCONTROL="ignoredups"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export ENHANCD_FILTER=fzf:fzy:percol:pick:selecta:fpp
export ENHANCD_DISABLE_HYPHEN=1
if (( $+commands[pygmentize] )) ; then
    export LESSOPEN="|pygmentize -O style=monokai -f 16m %s"
elif (( $+commands[src-hilite-lesspipe.sh] )) ; then
    export LESSOPEN="|src-hilite-lesspipe.sh %s"
fi
if (( $+commands[rg] )) ; then
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
elif (( $+commands[ag] )) ; then
    export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
export HH_CONFIG=hicolor
if [[ -n "$DISPLAY" ]] ; then
    export BROWSER=firefox
fi

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end mode
export LESS_TERMCAP_se=$'\E[0m' # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m' # end underline
export LESS_TERMCAP_us=$'\E[01;32m' # begin underline
# For colored man pages, Konsole requires this set (see: https://unix.stackexchange.com/a/147)
export GROFF_NO_SGR=yes
# On OpenSuSE, show the first matching man page rather than a list of matching man pages 
# (see https://www.suse.com/releasenotes/i386/openSUSE/11.1/RELEASE-NOTES.en.html)
export MAN_POSIXLY_CORRECT=1
#export JAVA_HOME=/usr/java/latest
