#!/bin/sh

## autoload vcs and colors
autoload -Uz vcs_info
autoload -U colors && colors

## the mux...
if [ -z "$TMUX" ]
then
    tmux attach -t MAIN || tmux new -s MAIN
fi

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# add a function to check for untracked files in the directory.
# from https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:git:*' formats " %r/%S %b %m%u%c "
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})"

# format our main prompt for hostname current folder, and permissions.
#PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
#PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT="%(?:%{$fg_bold[green]%}#> :%{$fg_bold[red]%}#> )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

# Plugs
source /home/$USER/.config/zshplugs/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /home/$USER/.config/zshplugs/zsh-completions/zsh-completions.plugin.zsh
source /home/$USER/.config/zshplugs/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source /home/$USER/.config/zshplugs/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Applications
export PATH="$HOME/.local/bin:$PATH"
export TERMINAL=/bin/alacritty
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=/home/brian/.local/bin:$PATH
export PATH=/.cargo/bin:$PATH
export BROWSER=/bin/chromium
export EDITOR=/bin/nvim

# Aliases - ubuntu
# alias sau="sudo apt update && sudo apt upgrade"
# alias ga="git add"
# alias gcm="git commit -m"
# alias gp="git push"
# alias gco="git checkout"
# alias nvide="neovide"
# =======

# aliases
alias xbq="sudo xbps-query -Rs"
alias xbi="sudo xbps-install -S"
alias xbu="sudo xbps-install -Su"
alias nv="nvim"
alias ls='ls --color'
alias gcm='git commit -m'
alias gc='git checkout'
alias ga='git add'
alias gp='git push origin'
# original vim
alias vim='vim-normal'
alias mdb='sudo mariadb -u admin_user -p'

# rx used to fzf in terminal
function displayhelp() {
  printf "
  rx: open files, cd into directories and stuff
  using find and fzf.
  usage: rx [options]
  OPTIONS

  => no arguments \n\t open files via \$opener. (xdg-open is set as default)
  => -l \n\t open files but don't close fzf.
  => -d \n\t open directories in a subshell.
  => -h / --help \n\t display help text.
  => -z \n\t search for files and open the directory in which they are located.\n\n";}

function rx() {
  if [[ -z $(command -v fzf) ]]; then
    printf "install fzf.\
      \nfzf is required for this script to function."\
      && exit 0; fi

  case $1 in
    "") find / -type f 2>/dev/null | fzf --bind=enter:execute'(xdg-open {})' --bind=enter:+close ;;
    -l) find / -type f 2>/dev/null | fzf --bind=enter:execute'(xdg-open {})' ;;
    -d) folder="$(find / -type d 2>/dev/null | fzf)" && cd "$folder" ;;
    -h|--help) displayhelp ;;
    -z) folder="$(find / -type f 2>/dev/null | fzf)" && \
      cd "$(dirname $folder)" ;;
  esac; }


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias luamake=/home/brian/lua-language-server/3rd/luamake/luamake

# NVIM APP SWITCHING
alias nviml="NVIM_APPNAME"="lazyvim nvim"

function nvims() {
  items=("default" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

