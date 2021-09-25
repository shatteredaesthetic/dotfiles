# Zshrc Configuration File

# Import Aliases
source "$XDG_CONFIG_HOME/zsh/aliases"
# Import Scripts
source "$XDG_CONFIG_HOME/zsh/scripts.sh"

# Enable completion system
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh

# autoload contents of 'external' folder
fpath=($ZDOTDIR/external $fpath)

# Prompt
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Zsh Directory stack
# Push the current directory visited on to the stack
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd
setopt PUSHD_SILENT

# Vi Mode
bindkey -v
export KEYTIMEOUT=1

# Cursor Mode
autoload -Uz cursor_mode && cursor_mode

# Vim Movement Keys
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Edit commands in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bd: Jumping to parent directory
source ~/dotfiles/zsh/external/bd.zsh

# fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

# autostart i3
# if [ "$(tty)" = "/dev/tty1" ];
# then
#     pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
# fi
