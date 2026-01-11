# Set up the prompt

setopt inc_append_history
setopt share_history

# 
setopt auto_cd
setopt auto_pushd

autoload -Uz promptinit
promptinit
prompt adam1
# prompt
# local GREEN=$'%{\e[1;32%}'
# local ORANGE=$'%{\e[1;33%}'
# local DEFAULT=$'%{\e[1;m%}'
# PROMPT=$ORANGE'[%n]%#>'$WHITE
# RPROMPT=$DEFAULT'[%~]'$WHITE
# setopt transient_rprompt

export MAIL='tozaki@student.42tokyo.jp'

# alias
alias ls='ls -F'
alias ccw='cc -Wall -Wextra -Werror'
alias val="valgrind --leak-check=full --show-leak-kinds=all -q"
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias clip="xsel --clipboard --input"
alias nv="nvim"
alias obsidian="nohup /home/tozaki/app/obsidian/Obsidian-1.9.14.AppImage &"
alias norm="norminette && ~/checkjp.sh"
source $ZSH~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
alias mini='~/mini-moulinette/mini-moul.sh'
alias mkc='touch ${PWD:t}.c'


alias francinette=/home/tozaki/francinette/tester.sh
alias paco=/home/tozaki/francinette/tester.sh

# 
