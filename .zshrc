## FIG
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

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

PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/Library/Apple/usr/bin:/usr/local/opt:/Users/axel/.symfony/bin:/usr/local/opt/openssl@3/bin"

## NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

## RUBY
export PATH="$PATH:$HOME/.rvm/bin"

## CARGO
export PATH="$PATH:$HOME/.cargo/bin"

## ALIASES
alias sc="source ~/.zshrc"
alias kitty="/Applications/kitty.app/Contents/MacOS/kitty"
alias sshk="kitty +kitten ssh"

## DOTFILES REPO
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias dfi='dotfiles'
alias dfs='dotfiles status'
alias dfl='dotfiles log'
alias dfd='dotfiles diff'
alias dfc='dotfiles commit'
alias dfp='dotfiles push'

## ANDROID STUDIO
export CAPACITOR_ANDROID_STUDIO_PATH="/Users/axel/Applications/JetBrains Toolbox/Android Studio.app"

## FZF CONFIG
export FZF_DEFAULT_OPTS='--height 80% --reverse --border=rounded'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"

export LAB="$HOME/Documents/lab"
export COURS="$HOME/Documents/COURS/"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## STARSHIP
eval "$(starship init zsh)"

## FIG
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# pnpm
export PNPM_HOME="/Users/axel/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# Herd injected PHP binary.
export PATH="/Users/axel/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/axel/Library/Application Support/Herd/config/php/82/"
