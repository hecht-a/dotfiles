export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    fzf
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-syntax-highlighting
    symfony
    themes
    git
    jsontools
    )

source $ZSH/oh-my-zsh.sh

## ALIASES
documents="~/Documents"
alias edi="cd ${documents}/edi-app"
alias heisenberg="cd ${documents}/heisenberg"
alias dotfiles="cd ${documents}/dotfiles"
alias browser="cd ~/meta-browser && pnpm run start"
alias sc="source ~/.zshrc"
alias maj="sudo sh ~/maj.sh"

alias preprod-batch="ssh adminweb@C-BATCH.cer02.intra"
alias preprod="ssh adminweb@dev-01-webisy.cer02.intra"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


## CARGO
export PATH="$PATH/.cargo/bin"

# PNPM
PNPM_HOME="/usr/local/bin/pnpm"
export PNPM_HOME="/home/ahecht/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'