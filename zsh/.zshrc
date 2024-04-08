bindkey -e

# ===== HISTORY SETTINGS =====
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extended_history        # write the history file in the ':start:elapsed;command' format
unsetopt hist_beep             # don't beep when attempting to access a missing history entry
setopt hist_reduce_blanks      # remove superfluous blanks from each command line being added to the history list
setopt hist_save_no_dups       # don't write a duplicate event to the history file
setopt hist_verify             # don't execute immediately upon history expansion
setopt inc_append_history_time # write to the history file immediately, not when the shell exits
unsetopt share_history         # don't share history between all sessions

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ===== PATH SETTINGS =====

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  path+=("$HOME/bin" $path)
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  path+=("$HOME/.local/bin" $path)
fi

# add dotnet tools if they exist
if [ -d "$HOME/.dotnet/tools" ] ; then
  path+=("$HOME/.dotnet/tools" $path)
fi

# set PATH so it includes bobbed nvim, if it exists
if [ -d "$HOME/.local/share/bob/nvim-bin" ] ; then
  path+=("$HOME/.local/share/bob/nvim-bin" $path)
fi

# ===== SHELL CONFIG =====

### file name colours
source ~/.config/zsh/lscolors.sh

### ctrl+arrows
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

### ctrl+delete
bindkey "\e[3;5~" kill-word

### ctrl+backspace
bindkey '^H' backward-kill-word

# smart-ish case insensitive completion match (lower matches upper, upper does not match lower)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ==== ALIASES =====

# aliases
alias l='ls -l'
alias ll='ls -la'

alias e='eza -l'
alias ee='eza -laa'

# nvm => the Node Volume Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf installation
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# starship prompt
eval "$(starship init zsh)"


