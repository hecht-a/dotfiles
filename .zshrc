export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

export PATH="/home/ahecht/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

plugins=(
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-syntax-highlighting
    symfony
    themes
    git
    jsontools
    history
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
export PATH="$HOME/.cargo/bin:$PATH"

# PNPM
PNPM_HOME="/usr/local/bin/pnpm"
export PNPM_HOME="/home/ahecht/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# FZF
export PATH="$HOME/.fzf/bin:$PATH"

# MSSQL
export PATH="$PATH:/opt/mssql-tools/bin"

# JETBRAINS TOOLBOX
export PATH="$PATH:/home/ahecht/.local/share/JetBrains/Toolbox/scripts"

eval "$(starship init zsh)"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
