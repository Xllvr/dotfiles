# Default apps
export EDITOR='neovim'
export VISUAL='sxiv'
export SHELL='zsh'

################################# Auto Complete ##############################################
autoload -Uz compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
setopt COMPLETE_ALIASES

################################### Vi Stuff ################################################
# vi mode
bindkey -v
export KEYTIMEOUT=1
# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Autocorrection
ZSH_DISABLE_COMPFIX=true
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

################################# Plugins ##############################################
# Load zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
# Load zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
# Load zsh you-should-use
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh


################################# Aliases ##############################################
# This section is for aliases that are useful for regular commands
alias v='nvim'
alias cleanmake='sudo make clean install'
alias unmake='sudo make uninstall'
alias lsa='ls -a --color=auto'
alias pfetch='~/repos/pfetch/pfetch'

# git management
function lazygit() {
      git add .
      git commit -a -m "$1"
      git push
}

function configupdate() {
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add $1
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit -a -m "$2"
    /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push
}

# for package management (pacman)
alias p='sudo pacman'
alias ps='sudo pacman -S'
alias psearch='sudo pacman -Ss'
alias porp='sudo pacman -Rs $(pacman -Qtdq)'
alias pr='sudo pacman -Rns'

# for dotfile management
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# for ls colors
alias ls='ls --color=auto'

# for nvim to open tabs
alias vt='nvim -p' # open in tabs
alias vr='nvim -S' # open saved session

################################# Documents ##############################################
# for quick access to HT folder
alias ht='cd /media/mydisk/GDrive/School/"Honours Thesis"'

# for school folder
alias sch='cd /media/mydisk/GDrive/School/"Year 4 Sem 2"'

# for nvim configuration
alias nvcon='nvim .config/nvim/init.vim'

# use lf to switch directories and bind it to ctrl-o
 lfcd () {
     tmp="$(mktemp)"
     lf -last-dir-path="$tmp" "$@"
     if [ -f "$tmp" ]; then
         dir="$(cat "$tmp")"
         rm -f "$tmp"
         if [ -d "$dir" ]; then
             if [ "$dir" != "$(pwd)" ]; then
                 cd "$dir"
             fi
         fi
     fi
}

bindkey -s '^o' 'lfcd\n'  # zsh

################################# Centering ##############################################
# load terminfo modules to make the associative array $terminfo available
zmodload zsh/terminfo 

# save current prompt to parameter PS1o
PS1o="$PS1"

# calculate how many lines one half of the terminal's height has
halfpage=$((LINES/2))

# construct parameter to go down/up $halfpage lines via termcap
halfpage_down=""
for i in {1..$halfpage}; do
  halfpage_down="$halfpage_down$terminfo[cud1]"
done

halfpage_up=""
for i in {1..$halfpage}; do
  halfpage_up="$halfpage_up$terminfo[cuu1]"
done

magic-enter () {
    if [[ -z $BUFFER ]]
    then
            print ${halfpage_down}${halfpage_up}$terminfo[cuu1]
            zle reset-prompt
    else
            zle accept-line
    fi
}
zle -N magic-enter
bindkey "^M" magic-enter


################################# Spaceship ##############################################
# Spaceship Config
SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_USER_SHOW=false
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_DOCKER_CONTEXT_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_VENV_SHOW=false
SPACESHIP_PYENV_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

# Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
