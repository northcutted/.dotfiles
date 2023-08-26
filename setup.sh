#!/bin/bash

# Update Homebrew, or install if it's missing
if ! which brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew..."
    brew update
fi

# Install oh-my-zsh if it's missing
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install necessary tools via Homebrew
tools=(
    powerlevel10k
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    fzf
    git-extras
    pygmentize
    jenv
    nvm
    pyenv
    exa
    miniconda3
    terraform
    kubectl
    visual-studio-code-insiders
)

for tool in "${tools[@]}"; do
    if ! brew list | grep -q "^${tool}\$"; then
        echo "Installing ${tool}..."
        brew install $tool
    else
        echo "${tool} already installed. Skipping."
    fi
done

# Setup p10k prompt
if [ ! -f "$HOME/.p10k.zsh" ]; then
    echo "Setting up powerlevel10k..."
    echo 'source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
fi

# Setup nvm
if [ ! -f "/opt/homebrew/opt/nvm/nvm.sh" ]; then
    mkdir ~/.nvm
    echo 'export NVM_DIR="$HOME/.nvm"' >>~/.zshrc
    echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm' >>~/.zshrc
fi

echo "Setup complete!"

