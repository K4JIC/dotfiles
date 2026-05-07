# Set up the prompt

# history
setopt inc_append_history
setopt histignorealldups sharehistory
export HISTSIZE=100000
export EXTENDED_HISTORY='%Y%m%d%H:%M:%S'
HISTFILE=~/.zsh_history
SAVEHIST=100000

setopt auto_cd
setopt auto_pushd

# prompt
autoload -Uz promptinit
promptinit
prompt adam1
# local GREEN=$'%{\e[1;32%}'
# local ORANGE=$'%{\e[1;33%}'
# local DEFAULT=$'%{\e[1;m%}'
# PROMPT=$ORANGE'[%n]%#>'$WHITE
# RPROMPT=$DEFAULT'[%~]'$WHITE
# setopt transient_rprompt

export MAIL='tozaki@student.42tokyo.jp'

# alias
alias ls='ls -F'
alias vi=vim
alias zed=zeditor
alias ccw='cc -Wall -Wextra -Werror'
alias val="valgrind --leak-check=full --show-leak-kinds=all -q"
alias tree="pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/| /g'"
alias clip="xsel --clipboard --input"
alias nv="nvim"
alias norm="norminette && ~/checkjp.sh"
alias mini='~/mini-moulinette/mini-moul.sh'
alias mkc='touch ${PWD:t}.c'
alias francinette=/home/tozaki/francinette/tester.sh
alias paco=/home/tozaki/francinette/tester.sh
source $ZSH~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

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

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
export PATH=$HOME/.local/bin:$PATH

# tmux layout: nvim (left) + gemini (right)
ide() {
    local session_name=$(basename "$PWD" | tr . _)
    if [ -n "$TMUX" ]; then
        # Already inside tmux: split current window
        tmux split-window -h -p 35 "gemini"
        tmux send-keys -t top-left "nvim ." C-m
		tmux select-pane -L
    else
        # Not in tmux: create new session
        tmux new-session -d -s "$session_name"
        tmux send-keys -t "$session_name" "nvim ." C-m
        tmux split-window -h -p 35 -t "$session_name" "gemini"
        tmux attach-session -t "$session_name"
		tmux select-pane -L
    fi
}
