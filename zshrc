export PAGER='less'

# Aliases
alias t="task"
alias v="vim"
alias g="git"
alias l="ls"
alias c="cd"
alias dc="docker-compose"
alias mux="tmuxinator"
if ~/.scripts/command_is_available trash-put; then
  alias rm="trash-put"
fi

# remove command lines from the history list when the first character on the
# line is a space
setopt histignorespace

# load zgen
source "${HOME}/.zgen/zgen.zsh"

#theme
source "${HOME}/dotfiles/settings/maxtheme"

source "${HOME}/.bash_profile"

# check if there's no init script
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen oh-my-zsh

  # plugins
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/sudo
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/tmux
  zgen oh-my-zsh plugins/docker
  zgen oh-my-zsh plugins/docker-compose
  zgen oh-my-zsh plugins/asdf
  zgen oh-my-zsh plugins/yarn
  zgen oh-my-zsh plugins/rvm

  # completions
  zgen load zsh-users/zsh-completions src
  zgen load zsh-users/zsh-autosuggestions

  # theme
  #zgen oh-my-zsh themes/arrow

  # save all to init script
  zgen save
fi

# if $LANG isnt set set it to en_US.UTF-8
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Load FZF when available
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# PATH setting
PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/bin/vendor_perl:/usr/bin/core_perl
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.scripts
PATH=$PATH:$HOME/.bin

#chpwd is called after changing directories
function chpwd(){
  #call ls after cd
  ls;
}
