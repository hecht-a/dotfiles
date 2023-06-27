# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH="$HOME/.oh-my-zsh"

source ~/.ssh.zsh

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
alias setphp="sudo update-alternatives --config php; sudo update-alternatives --config phar; update-alternatives --config phar.phar; systemctl restart apache2"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## VPN CERFRANCE
alias vpn_up="sudo ipsec up cerfrance"
alias vpn_down="sudo ipsec down cerfrance"
alias vpn_restart="sudo ipsec restart"
alias vpn_status="sudo ipsec status"

## DOTFILES REPO
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias dfi='dotfiles'
alias dfs='dotfiles status'
alias dfl='dotfiles log'
alias dfd='dotfiles diff'
alias dfc='dotfiles commit'
alias dfp='dotfiles push'

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

# KEY BINDING
bindkey '^H' backward-kill-word # Ctrl+Backspace: kill the word backward

bindkey '^[[3;5~' kill-word # Ctrl+Delete: kill the word forward

bindkey "^[[1;3C" forward-word # Alt+Right: Move after word at right

bindkey "^[[1;3D" backward-word # Alt+Left: Move after word at left

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
