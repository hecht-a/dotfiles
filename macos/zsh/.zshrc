# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="axel"

plugins=(
  git
  gpg-agent
  nvm
  themes
  timer
  zsh-autosuggestions
  zsh-interactive-cd
  zsh-syntax-highlighting
  )

PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/Library/Apple/usr/bin:/usr/local/opt:/Users/axel/.symfony/bin:/usr/local/opt/openssl@3/bin"

# installedPhpVersions=($(brew ls --versions | ggrep -E 'php(@.*)?\s' | ggrep -oP '(?<=\s)\d\.\d' | uniq | sort))
#
# for phpVersion in ${installedPhpVersions[*]}; do
#     value="{"
#
#     for otherPhpVersion in ${installedPhpVersions[*]}; do
#         if [ "${otherPhpVersion}" != "${phpVersion}" ]; then
#             value="${value} brew unlink php@${otherPhpVersion};"
#         fi
#     done
#
#     value="${value} brew link php@${phpVersion} --force --overwrite; } &> /dev/null && export PATH='/usr/local/opt/php@${phpVersion}/bin:$PATH' && php -v"
#
#     alias "php@${phpVersion}"="${value}"
# done

# SPACESHIP_TIME_SHOW="true"
# SPACESHIP_EXIT_CODE_SHOW="true"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.cargo/bin"

alias sc="source ~/.zshrc"

source <(ng completion script)

export CAPACITOR_ANDROID_STUDIO_PATH="/Users/axel/Applications/JetBrains Toolbox/Android Studio.app"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"