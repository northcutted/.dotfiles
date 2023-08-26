# Error Handling (comment this out if it causes issues in interactive sessions)
# set -Eeuo pipefail

# Function to prepend directories to PATH if they exist
prepend_to_path() {
  for dir in "$@"; do
    [[ -d "$dir" ]] && PATH="$dir:$PATH"
  done
  export PATH
}

# Source p10k instant prompt if available
[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"

export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode auto # auto-update oh-my-zsh

# Plugins
plugins=(git zsh-autosuggestions zsh-completions z fzf git-extras git-prompt colorize)
source $ZSH/oh-my-zsh.sh

# Update PATH
prepend_to_path "$HOME/bin" "/usr/local/bin"

# User Configurations
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Source themes and plugins if they exist
[ -f /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme ] && source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -e "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"
[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## JAVA CONFIG
which jenv &>/dev/null && {
  prepend_to_path "$HOME/.jenv/bin"
  eval "$(jenv init -)"
}

## NODEJS CONFIG
[ -d "/opt/homebrew/opt/nvm" ] && {
  prepend_to_path "/opt/homebrew/opt/nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}

## PYTHON CONFIG
which pyenv &>/dev/null && {
  eval "$(pyenv init -)"
  prepend_to_path "$HOME/.local/bin" "$(pyenv root)/shims"
}

# Aliases
alias tf="terraform"
alias k="kubectl"
alias code="code-insiders"
alias cat='pygmentize -g'
which exa &>/dev/null && alias ls="exa"

# Init SSH agent
ssh-add -q &>/dev/null

# conda initialize
[ -f "$HOME/miniconda3/bin/conda" ] && {
  __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ] && source "$HOME/miniconda3/etc/profile.d/conda.sh" || prepend_to_path "$HOME/miniconda3/bin"
  fi
  unset __conda_setup
}

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
