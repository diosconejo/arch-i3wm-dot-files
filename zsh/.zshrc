# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%F{blue}%1~%f %# '
# aliases from bashrc
alias tilde='echo "~"'
alias diff='colordiff'              # requires colordiff package
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'
alias vi='vim'
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep'         # requires an argument
alias openports='ss --all --numeric --processes --ipv4 --ipv6'
alias pgg='ps -Af | grep'           # requires an argument
alias ..='cd ..'
alias plex='systemctl start plexmediaserver.service'
alias pvoxy='systemctl start privoxy.service'
alias rsync='rsync -r -a'
alias dxssh='ssh -i $HOME/.ssh/DXaaS.ppk'
alias team='sudo systemctl restart teamviewerd && sudo systemctl status teamviewerd' 
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -trl'
alias l='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias cls=' echo -ne "c"'       # clear screen for real (it does not work in Terminology)
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'
alias pacsyy='sudo pacman -Syy '
alias pacs='sudo pacman -S '
alias pacss='sudo pacman -Ss '
alias pacrsn='sudo pacman -Rsn '
alias pacqs='sudo pacman -Qs '
alias pacsc='sudo pacman -Sc '
alias x='startx '
alias cal='cal -m '
alias fox='firefox --private-window'
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed
#alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias restart='i3-msg [class="google-chrome"] kill && sudo systemctl reboot'
alias stop='i3lock && sudo echo mem > /sys/power/state'
alias halt='i3-msg [class="google-chrome"] kill && sudo systemctl poweroff'
alias sleep='sudo systemctl hybrid-sleep'
alias qemucdrom='qemu-kvm -enable-kvm -cdrom '
alias android='simple-mtpfs $HOME/Android'
alias unandroid='fusermount -u $HOME/Android'
#alias googledrive="gcsf mount $HOME/gdrive -s $1"
#alias ungoogledrive='fusermount -u $HOME/gdrive'
#alias calc='mate-calc'
alias vlc='flatpak run org.videolan.VLC'
alias dfall='df -h | egrep "/dev|Used"'
alias dpmsoff='xset s off -dpms'

POWERLEVEL9K_MODE='nerdfont-complete'
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme


eval $(dircolors $HOME/dotfiles/.dircolors)

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

setopt  autocd autopushd 
autoload -U compinit
compinit

alias g=git
alias ga='git add'
alias gapa='git add --patch'
alias gap='git apply'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gau='git add --update'
alias gstp='git stash pop'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gcs='git commit -S'
alias glg='git log --stat'

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
