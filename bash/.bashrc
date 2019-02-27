export PEARL_ROOT=$HOME/.local/share/pearl
source $HOME/.local/share/pearl/boot/sh/pearl.sh
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
alias tilde='echo "~"'

## Modified commands ## {{{
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias vi='vim'
# }}}

## New commands ## {{{
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
# }}}

alias plex='systemctl start plexmediaserver.service'
alias pvoxy='systemctl start privoxy.service'

alias rsync='rsync -r -a'
# Privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudoedit'
    alias root='sudo -i'
    alias reboot='sudo systemctl reboot'
    alias poweroff='sudo systemctl poweroff'
    alias update='sudo pacman -Su'
    alias netctl='sudo netctl'
    alias inet='sudo systemctl restart dhcpcd@enp2s0.service'
    alias gpart='sudo gparted'
fi

## ls ## {{{
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -trl'
alias l='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
# }}}

## Safety features ## {{{
alias cp='cp -i'
alias mv='mv -i'
#alias rm='rm -I'                    # 'rm -i' prompts for every file
# safer alternative w/ timeout, not stored in history
#alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "c"'       # clear screen for real (it does not work in Terminology)
# }}}

## Make Bash error tolerant ## {{{
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
# }}}

# configure from below
#alias la='ls -tlra --color=auto'
#alias ll='ls -trl --color=auto'

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
alias pacsyy='sudo pacman -Syy '
alias pacsyu='pacaur -Syu'
alias pacs='pacaur -S '
alias pacss='sudo pacaur -Ss '
alias pacrsn='sudo pacman -Rsn '
alias pacqs='sudo pacaur -Qs '
alias pacsc='pacaur -Sc '
#alias pacsc='sudo pacman -Sc '
#tbd alias pacsc='sudo pacman '
alias x='startx '
alias cal='cal -m '

alias fox='firefox --private-window'
# Pacman alias examples
#alias pacupg='sudo pacman -Syu'	# Synchronize with repositories and then upgrade packages that are out of date on the local system.
#alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
#alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/
/ /g')"

# Additional pacman alias examples
#alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
#alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist


#alias restart='sudo shutdown -r now'
#alias stop='sudo shutdown -h now'
alias restart='i3-msg [class="google-chrome"] kill && sudo systemctl reboot'
alias stop='i3-msg [class="google-chrome"] kill && sudo systemctl poweroff'

alias qemucdrom='qemu-kvm -enable-kvm -cdrom '

alias android='simple-mtpfs $HOME/Android'
alias unandroid='fusermount -u $HOME/Android'

alias calc='mate-calc'

alias code='cd /ssd_ntfs/code && ls -trla'

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export MW_HOME=$HOME/Downloads/wls12130

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

shopt -s autocd
shopt -s checkwinsize
shopt -s extglob

bind '"[A": history-search-backward'
bind '"[B": history-search-forward'

# cd and ls in one
cl() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cl: '$dir': Directory not found"
    fi
}

note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s
" "$*" >> "$HOME/.notes"
    fi
}

todo() {
    if [[ ! -f $HOME/.todo ]]; then
        touch "$HOME/.todo"
    fi

    if ! (($#)); then
        cat "$HOME/.todo"
    elif [[ "$1" == "-l" ]]; then
        nl -b a "$HOME/.todo"
    elif [[ "$1" == "-c" ]]; then
        > $HOME/.todo
    elif [[ "$1" == "-r" ]]; then
        nl -b a "$HOME/.todo"
        eval printf %.0s- '{1..'"${COLUMNS:-$(tput cols)}"\}; echo
        read -p "Type a number to remove: " number
        sed -i ${number}d $HOME/.todo "$HOME/.todo"
    else
        printf "%s
" "$*" >> "$HOME/.todo"
    fi
}

calc() {
    echo "scale=3;$@" | bc -l
}

#PS1='[\u@\h \W]\$ '  # To leave the default one
#DO NOT USE RAW ESCAPES, USE TPUT
reset=$(tput sgr0)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)

#PS1='\[$red\]\u\[$reset\] \[$blue\]\w\[$reset\] \[$red\]\$ \[$reset\]\[$green\] '

EC() { echo -e '[1;33m'code $?'[m
'; }
trap EC ERR


# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'
'}history -a; history -c; history -r"

#alias tm="tmux attach || tmux new"

http_proxy="http://localhost:8118"
https_proxy="https://localhost:8118"
PATH=$HOME/exe:$PATH; export PATH
PATH="$HOME/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

MUSIC=/ssd_ntfs/iTunesMedia/Music
TERMINAL=urxvt; export TERMINAL
FA_UPLOAD=
FA_DOWNLOAD=
FA_CLOUD=

SYSTEMD_EDITOR='/usr/bin/vi'; export SYSTEMD_EDITOR;

# start dvtm in all shells
#[[ $TERM != "screen" ]] && dvtm && exit
